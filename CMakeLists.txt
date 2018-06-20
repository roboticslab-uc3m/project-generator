# Copyright: Universidad Carlos III de Madrid (C) TEMPLATE_YEAR
# Authors: TEMPLATE_AUTHOR
# CopyPolicy: Released under the terms of the TEMPLATE_LICENSE

cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

# Start a project.
project(TEMPLATE_NAME)

# Set module path.
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake
                              ${CMAKE_SOURCE_DIR}/cmake/modules
                              ${CMAKE_SOURCE_DIR}/cmake/find-modules)

# Find YCM.
find_package(YCM 0.8 REQUIRED)

# Find YARP.
# https://github.com/roboticslab-uc3m/questions-and-answers/issues/65
find_package(YARP 3.0 QUIET)
if(NOT YARP_FOUND)
    find_package(YARP 2.3.70 REQUIRED)
endif()

# Add WITH_PLUGINS if this projects exports YARP devices.
yarp_configure_external_installation(TEMPLATE_LOWER)

# Retrieve current TEMPLATE_NAME version.
include(TEMPLATE_NAMEVersion)

# Define standard paths, check system configuration.
include(TEMPLATE_NAMESystem)

# Setup build options.
include(TEMPLATE_NAMEOptions)

# Define global properties to store relevant configuration.
set_property(GLOBAL PROPERTY TEMPLATE_NAME_INCLUDE_DIRS)
set_property(GLOBAL PROPERTY TEMPLATE_NAME_TARGETS)

# Define and enter subdirectories.
add_subdirectory(cmake)
add_subdirectory(share)
add_subdirectory(libraries)
add_subdirectory(programs)

# Output configuration files.
include(TEMPLATE_NAMEDescribe)

# Create target for documentation generation.
include(TEMPLATE_NAMEDoc)

# Invoke CPack from here.
include(TEMPLATE_NAMEPackage)

# Generate a report of enabled/disabled features.
feature_summary(FATAL_ON_MISSING_REQUIRED_PACKAGES WHAT ALL)
