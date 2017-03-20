CMAKE_MINIMUM_REQUIRED(VERSION 2.6 FATAL_ERROR)
CMAKE_POLICY(VERSION 2.6)

# finds and loads settings from an external project
FIND_PACKAGE(Torch REQUIRED)
FIND_PACKAGE(Caffe REQUIRED)
FIND_PACKAGE(CUDA)

# add directory to be included
INCLUDE_DIRECTORIES(${TORCH_INSTALL}/include)
INCLUDE_DIRECTORIES(${TORCH_INSTALL}/include/TH)
INCLUDE_DIRECTORIES(${Caffe_INCLUDE_DIRS}) 
INCLUDE_DIRECTORIES(${CUDA_INCLUDE_DIRS})

# specify directories in which the linker will look for libraries
LINK_DIRECTORIES(${Torch_INSTALL_LIB})

SET(src caffe.cpp)

FILE(GLOB luasrc *.lua)

ADD_TORCH_PACKAGE(tcaffe "${src}" "${luasrc}")
TARGET_LINK_LIBRARIES(tcaffe TH ${Caffe_LIBRARIES})
IF(LUALIB)
  TARGET_LINK_LIBRARIES(tcaffe ${LUALIB})
ENDIF()

