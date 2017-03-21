local Net, parent = torch.class('caffe.Net', 'nn.Module')
local ffi = require 'ffi'
local C = caffe.C

-- support loading caffe model only with prototxt file without binary file 
-- by default parameters: prototxt_name, binary_name, phase_name 
function Net:__init(...)
  local arg = {...}
  local n = #arg 
  if n == 3 then -- the order: txt file, binary file, phase name 
    self.prototxt_name = arg[1]
    self.binary_name = arg[2]
    self.phase_name = arg[3]
  else -- by default: txt file, phase name , 
    self.prototxt_name = arg[1]
    self.binary_name = nil
    self.phase_name = arg[2]    
  end 
  assert(type(self.prototxt_name) == 'string')
  --assert(type(binary_name) == 'string')
  assert(type(self.phase_name) == 'string')
  parent.__init(self)
  self.handle = ffi.new'void*[1]'
  local old_handle = self.handle[1]
  C.init(self.handle, self.prototxt_name, self.binary_name, self.phase_name)
  if(self.handle[1] == old_handle) then
    print 'Unsuccessful init'
  end
  self.output = torch.Tensor()
  self.gradInput = torch.Tensor()
  self:float()
end

function Net:blobs(name)
  assert(type(name) == 'string')
  local blob_tensor = torch.Tensor()
  C.get_blob_by_name(self.handle, name, blob_tensor:cdata())
  return blob_tensor
end

function Net:forward(input)
  assert(input:type() == 'torch.FloatTensor')
  C.do_forward(self.handle, input:cdata(), self.output:cdata())
  return self.output
end

function Net:updateGradInput(input, gradOutput)
  assert(input:type() == 'torch.FloatTensor')
  assert(gradOutput:type() == 'torch.FloatTensor')
  C.do_backward(self.handle, gradOutput:cdata(), self.gradInput:cdata())
  return self.gradInput
end

function Net:forwardPrefilled()
  C.do_forward_prefilled(self.handle, self.output:cdata())
  return self.output
end

function Net:reset()
  C.reset(self.handle)
end

function Net.setModeCPU()
  C.set_mode_cpu()
end

function Net.setModeGPU()
  C.set_mode_gpu()
end

function Net.setDevice(device_id)
  C.set_device(device_id)
end

