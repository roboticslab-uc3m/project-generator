# Copyright: Universidad Carlos III de Madrid (C) TEMPLATE_YEAR
# Authors: TEMPLATE_AUTHOR
# CopyPolicy: Released under the terms of the GNU GPL v2.0.

cmake_minimum_required(VERSION 2.8.9 FATAL_ERROR)

# Start a project.
project(TEMPLATE_NAME)

# Set module path.
set(TEMPLATE_NAME_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
list(APPEND CMAKE_MODULE_PATH ${TEMPLATE_NAME_MODULE_PATH})

# Bootstrap YCM.
include(YCMBootstrap)

# Retrieve current TEMPLATE_NAME version.
include(TEMPLATE_PASCALVersion)

# Define standard paths, check system configuration.
include(TEMPLATE_PASCALSystem)

# Setup build options.
include(TEMPLATE_PASCALOptions)

# Define global properties to store relevant configuration.
set_property(GLOBAL PROPERTY TEMPLATE_NAME_INCLUDE_DIRS)
set_property(GLOBAL PROPERTY TEMPLATE_NAME_LIBRARIES)
set_property(GLOBAL PROPERTY TEMPLATE_NAME_TARGETS)

# Define and enter subdirectories.
add_subdirectory(share)
add_subdirectory(libraries)
add_subdirectory(programs)

# Output configuration files.
include(TEMPLATE_PASCALDescribe)

