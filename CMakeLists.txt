CMAKE_MINIMUM_REQUIRED(VERSION 2.6 FATAL_ERROR)
CMAKE_POLICY(VERSION 2.6)
# set variable CMAKE_MODULE_PATH to the list of values: 
# CMAKE_MODULE_PATH: list of directories to search for cmake modules 
SET(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake" "${CMAKE_MODULE_PATH}")

# finds and loads settings from an external project
FIND_PACKAGE(Torch REQUIRED)
FIND_PACKAGE(CUDA)

# Caffe may have been compiled without CUDA support
# (Caffe headers check for CPU_ONLY flag)
IF(NOT CUDA_FOUND)
	add_definitions(-DCPU_ONLY)
	SET(CUDA_INCLUDE_DIRS "")
ENDIF()

IF(NOT EXISTS ${CAFFE_DIR})
  SET(CAFFE_DIR "$ENV{CAFFE_DIR}")
ENDIF()
MESSAGE("CAFFE_DIR: " ${CAFFE_DIR})

# add directory to be included
INCLUDE_DIRECTORIES("${Torch_INSTALL_INCLUDE}/TH" "${CAFFE_DIR}/include" "${CAFFE_DIR}/build/src" ${CUDA_INCLUDE_DIRS})

# specify directories in which the linker will look for libraries
LINK_DIRECTORIES("${Torch_INSTALL_LIB}" "${CAFFE_DIR}/build/lib")
# add -D define flags to the compilation of source file
add_definitions(-Wl,-as-needed)

SET(src caffe.cpp ${PROTO_SRCS})

FILE(GLOB luasrc *.lua)

ADD_LIBRARY(tcaffe MODULE ${src})
TARGET_LINK_LIBRARIES(tcaffe TH caffe glog)

### Torch packages supposes libraries prefix is "lib"
SET_TARGET_PROPERTIES(tcaffe PROPERTIES
  PREFIX "lib"
  IMPORT_PREFIX "lib")
    
INSTALL(TARGETS tcaffe
    RUNTIME DESTINATION "${CMAKE_CURRENT_LIST_DIR}/dir/"
  LIBRARY DESTINATION "${CMAKE_CURRENT_LIST_DIR}/dir/")

INSTALL(
  FILES
  ${luasrc}
  DESTINATION "${CMAKE_CURRENT_LIST_DIR}/caffe")
