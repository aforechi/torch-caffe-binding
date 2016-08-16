torch-caffe-binding
===================

A short binding to use Caffe as a module in Torch7. Has the same functionality as MATLAB bindings.

(Mathod 1) You have to have installed and built Caffe, then do this:

```bash
CAFFE_DIR=/*path-to-caffe-root*/ luarocks install caffe
```
thus you can directly load this package using command below:
```lua
require 'caffe'
```

(Method 2) This is my way of installing torch-caffe-binding.
Fist I modify CMakeList.txt file [here](https://github.com/eriche2016/torch-caffe-binding/blob/master/CMakeLists.txt#L44-L50)
```bash
CAFFE_DIR=/home/hxw/visual_concepts_image_caption/caffe cmake .
```
then install it:
```bash 
make install 
```
### testing the model ####
```lua
torch_caffe_pkg_path = './?/init.lua' --in this directory 
package.path = torch_caffe_pkg_path .. ';' .. package.path -- add to package search variable
require 'caffe'
net = caffe.Net('../mil_finetune.prototxt.deploy', 'test')
```
###Tutorials###
Forward and backward are supported:

```lua
torch_caffe_pkg_path = './?/init.lua' --in this directory 
package.path = torch_caffe_pkg_path .. ';' .. package.path -- add to package search variable
require 'caffe'

net = caffe.Net('deploy.prototxt', 'bvlc_alexnet.caffemodel', 'test')
input = torch.FloatTensor(10,3,227,227)
output = net:forward(input)

gradOutput = torch.FloatTensor(10,1000,1,1)
gradInput = net:backward(input, gradOutput)
```

Use can also use it inside a network as nn.Module, for example:

```lua
torch_caffe_pkg_path = './?/init.lua' --in this directory 
package.path = torch_caffe_pkg_path .. ';' .. package.path -- add to package search variable
require 'caffe'

model = nn.Sequential()
model:add(caffe.Net('deploy.prototxt', 'bvlc_alexnet.caffemodel', 'test'))
model:add(nn.Linear(1000,1))
```
Support loading models based only on the prototxt file and without the binary .caffemodel

To load Caffe networks in Torch7 without having Caffe installed use this:
https://github.com/szagoruyko/loadcaffe
