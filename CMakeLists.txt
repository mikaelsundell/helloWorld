# Copyright 2022-present Contributors to the helloWorld project.
# SPDX-License-Identifier: BSD-3-Clause
# https://github.com/mikaelsundell/helloWorld

# usage:
#   Build using system paths (verbose):
#     cmake ../ -DCMAKE_VERBOSE_MAKEFILE:BOOL=1
#  
#   Build using prefix path (verbose):
#     cmake -DCMAKE_PREFIX_PATH:STRING=<path>/3rdparty/build/macosx/arm64.debug -DCMAKE_VERBOSE_MAKEFILE:BOOL=1
#
#   Download and configure as cmake sub projects if not found

cmake_minimum_required (VERSION 3.23)
set (CMAKE_SUPPRESS_DEVELOPER_WARNINGS TRUE)

set (project_name "helloWorld")

project ("${project_name} project")

# cmake
list (APPEND CMAKE_MODULE_PATH
      "${PROJECT_SOURCE_DIR}/cmake"
      "${PROJECT_SOURCE_DIR}/cmake/modules")
include (utils)

# configuration
message (STATUS "Configuration")
if (NOT CMAKE_BUILD_TYPE)
    set (CMAKE_BUILD_TYPE "Debug")
endif ()
dump_configuration (${project_name})

# externals
message (STATUS "Dependencies")
include (FetchContent)

# helloFetch
set (helloFetch_tag "master")
message (STATUS "Download and build helloFetch: ${helloFetch_tag}")
FetchContent_Declare(
    helloFetch
    GIT_REPOSITORY https://github.com/mikaelsundell/helloFetch.git
    GIT_TAG ${helloFetch_tag}
    CMAKE_ARGS 
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    QUIET
)
FetchContent_MakeAvailable (helloFetch)
dump_fetch (helloFetch)

# # imath
# find_package (Imath CONFIG QUIET)
# if (NOT Imath_FOUND)
#     find_package (Imath QUIET)
#     if (NOT Imath_FOUND)
#         set (imath_tag "v3.1.9")
#         message (STATUS "Download and build Imath: ${imath_tag}")
#         FetchContent_Declare(
#             Imath
#             GIT_REPOSITORY https://github.com/AcademySoftwareFoundation/Imath.git
#             GIT_TAG ${imath_tag}
#             CMAKE_ARGS 
#                 -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
#             QUIET
#         )
#         FetchContent_MakeAvailable (Imath)
#         dump_fetch (Imath)
#     else ()
#         message (STATUS "Found imath package using cmake modules")
#         dump_properties ("Imath")
#     endif ()
# else()
#     message (STATUS "Found imath package using cmake config")
#     dump_properties ("Imath")
# endif ()

# # acescontainer
# find_package (AcesContainer CONFIG QUIET)   
# if (NOT AcesContainer_FOUND)
#     find_package (Imath QUIET)
#     if (NOT AcesContainer_FOUND)
#         set (acescontainer_tag "v1.0.2")
#         message (STATUS "Download and build ACES Container: ${acescontainer_tag}")
#         FetchContent_Declare(
#             AcesContainer
#             GIT_REPOSITORY https://github.com/ampas/aces_container.git
#             GIT_TAG ${acescontainer_tag}
#             CMAKE_ARGS 
#                 -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
#             QUIET
#         )
#         FetchContent_MakeAvailable (AcesContainer)
#         dump_fetch (AcesContainer)
#     else ()
#         message (STATUS "Found acescontainer package using cmake modules")
#         dump_properties ("AcesContainer")
#     endif ()
# else()
#     message (STATUS "Found acescontainer package using cmake config")
#     add_library (helloWorld::AcesContainer INTERFACE IMPORTED)
#     target_link_libraries(helloWorld::AcesContainer INTERFACE AcesContainer)
#     if(CMAKE_BUILD_TYPE STREQUAL "Debug")
#         target_link_libraries (
#             helloWorld::AcesContainer INTERFACE "AcesContainer"
#         )
#         target_link_libraries (
#             helloWorld::AcesContainer INTERFACE "AcesContainer_d"
#         )
#     endif ()
#     dump_properties ("AcesContainer")
# endif ()

# helloWorld
add_executable(${project_name} "helloWorld.cpp")
set_property (TARGET ${project_name} PROPERTY CXX_STANDARD 17)
#target_link_libraries(${project_name} PRIVATE Imath::Imath helloWorld::AcesContainer)
