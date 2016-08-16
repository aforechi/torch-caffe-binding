# Install script for directory: /home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/hxw/torch/install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF(EXISTS "$ENV{DESTDIR}/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/dir/libtcaffe.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/dir/libtcaffe.so")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/dir/libtcaffe.so"
         RPATH "$ORIGIN/../lib:/home/hxw/torch/install/lib:/home/hxw/visual_concepts_image_caption/caffe/build/lib")
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/dir/libtcaffe.so")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/dir" TYPE MODULE FILES "/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/libtcaffe.so")
  IF(EXISTS "$ENV{DESTDIR}/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/dir/libtcaffe.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/dir/libtcaffe.so")
    FILE(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/dir/libtcaffe.so"
         OLD_RPATH "/home/hxw/torch/install/lib:/home/hxw/visual_concepts_image_caption/caffe/build/lib:::::::::::::::"
         NEW_RPATH "$ORIGIN/../lib:/home/hxw/torch/install/lib:/home/hxw/visual_concepts_image_caption/caffe/build/lib")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/dir/libtcaffe.so")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/caffe/test.lua;/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/caffe/init.lua;/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/caffe/ffi.lua;/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/caffe/caffe.lua")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/caffe" TYPE FILE FILES
    "/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/test.lua"
    "/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/init.lua"
    "/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/ffi.lua"
    "/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/caffe.lua"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/hxw/visual_concepts_image_caption/models/vgg/torch-caffe-binding/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
