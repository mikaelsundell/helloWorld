# Copyright 2022-present Contributors to the helloWorld project.
# SPDX-License-Identifier: BSD-3-Clause
# https://github.com/mikaelsundell/helloWorld

cmake_minimum_required(VERSION 3.23)
set( project_name "helloWorld" )

project( "${project_name} project" )

# modules
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/modules" )

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif()

# configuration
message (STATUS "Configuring ${PROJECT_NAME} ${PROJECT_VERSION}")
message (STATUS "CMake                  = ${CMAKE_VERSION}")
message (STATUS "CMake system           = ${CMAKE_SYSTEM}")
message (STATUS "CMake system name      = ${CMAKE_SYSTEM_NAME}")
message (STATUS "Project source dir     = ${PROJECT_SOURCE_DIR}")
message (STATUS "Project build dir      = ${CMAKE_BINARY_DIR}")
message (STATUS "Project install prefix = ${CMAKE_INSTALL_PREFIX}")

# externals
message (STATUS "Configuring external")

include (ExternalProject)
set (external_prefix "${CMAKE_CURRENT_BINARY_DIR}/external")
set( imath_build 1 )
set( openexr_build 0 )
set( acescontainer_build 1 )
set( libraw_build 1 )

if ( imath_build )
    message (STATUS "Download and build Imath")
    
    set (imath_prefix "${external_prefix}/git/imath")
    ExternalProject_Add( 
        imath
        GIT_REPOSITORY https://github.com/AcademySoftwareFoundation/Imath.git
        GIT_TAG "v3.1.9"
        PREFIX ${imath_prefix}
        INSTALL_DIR ${external_prefix}
        CMAKE_ARGS 
            -DBUILD_TESTING=OFF
            -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} 
            -DCMAKE_INSTALL_PREFIX=${external_prefix} 
    )
endif()

if ( openexr_build )
    message (STATUS "Download and build OpenEXR")

    set (openexr_prefix "${external_prefix}/git/openexr")
    ExternalProject_Add( 
        openexr
        GIT_REPOSITORY https://github.com/openexr/openexr.git
        GIT_TAG "v3.2.0"
        PREFIX ${openexr_prefix}
        INSTALL_DIR ${external_prefix}
        CMAKE_ARGS 
            -DBUILD_TESTING=OFF 
            -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} 
            -DCMAKE_PREFIX_PATH=${external_prefix} 
            -DCMAKE_INSTALL_PREFIX=${external_prefix} 
    )
endif()

if (acescontainer_build)
    message (STATUS "Download and build ACES Container")
    
    set (acescontainer_prefix "${external_prefix}/git/aces_container")
    ExternalProject_Add( 
        acescontainer
        GIT_REPOSITORY https://github.com/ampas/aces_container.git
        GIT_TAG "v1.0.2"
        PREFIX ${acescontainer_prefix}
        INSTALL_DIR ${external_prefix}
        CMAKE_ARGS 
            -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} 
            -DCMAKE_INSTALL_PREFIX=${external_prefix} 
    )
endif()

#if (libraw_build)
#    message (STATUS "Download and build LibRaw")
    # dependencies: jpeg, jasper and lcms2?
#    set (libraw_prefix "${external_prefix}/git/libraw")
#    ExternalProject_Add( 
#        libraw
#        GIT_REPOSITORY https://github.com/LibRaw/LibRaw.git
#        GIT_TAG "0.21.1"
#        PREFIX ${libraw_prefix}
#        BUILD_IN_SOURCE 1
#        CONFIGURE_COMMAND 
#            ./mkdist.sh && ./configure
#    )
#endif()

# package
add_executable(${project_name} "helloWorld.cpp")
set_property (TARGET ${project_name} PROPERTY CXX_STANDARD 17)

include_directories(
)

target_link_libraries( ${project_name}
)
