# Copyright 2022-present Contributors to the helloWorld project.
# SPDX-License-Identifier: BSD-3-Clause
# https://github.com/mikaelsundell/helloWorld

cmake_minimum_required(VERSION 3.23)
set( project_name "helloWorld" )

project( "${project_name} project" )

# modules
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/modules" )

# package
add_executable( ${project_name} "helloWorld.cpp" )
set_property(TARGET ${project_name} PROPERTY CXX_STANDARD 17)

include_directories (
)

target_link_libraries( ${project_name}
)
