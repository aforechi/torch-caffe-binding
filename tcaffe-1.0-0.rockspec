package = "tcaffe"
version = "1.0-0"

source = {
   url = "git://github.com/aforechi/torch-caffe-binding",
   tag = "master"
}

description = {
   summary = "Use Caffe in Torch7",
   detailed = [[
A short binding to use Caffe as nn.Module in Torch7
   ]],
   homepage = "https://github.com/aforechi/torch-caffe-binding",
   license = "BSD"
}

dependencies = {
   "torch >= 7.0",
   "nn"
}

build = {
   type = "command",
   build_command = [[
cmake -E make_directory build && cd build && cmake .. -DLUALIB=$(LUALIB) -DLUA_INCDIR="$(LUA_INCDIR)" -DLUA_LIBDIR="$(LUA_LIBDIR)"  -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)" && $(MAKE)
   ]],
   install_command = "cd build && $(MAKE) install"
}
