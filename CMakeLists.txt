# Copyright: Universidad Carlos III de Madrid (C) TEMPLATE_YEAR
# Authors: TEMPLATE_AUTHOR
# CopyPolicy: Released under the terms of the TEMPLATE_LICENSE

cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

# Start a project. Set the LANGUAGES option according to your
# needs, e.g. 'C', 'CXX', 'NONE'.
project(TEMPLATE_NAME LANGUAGES CXX)

# Set module path.
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake
                              ${CMAKE_SOURCE_DIR}/cmake/modules
                              ${CMAKE_SOURCE_DIR}/cmake/find-modules)

# Hard dependencies.
find_package(YCM 0.10 REQUIRED)
find_package(YARP 3.0 REQUIRED)
find_package(COLOR_DEBUG REQUIRED)

# Soft dependencies.
find_package(Doxygen QUIET)
find_package(GTestSources 1.6.0 QUIET)

# Add WITH_PLUGINS if this projects exports YARP devices.
yarp_configure_external_installation(TEMPLATE_LOWER)

# Retrieve current TEMPLATE_NAME version.
include(TEMPLATE_NAMEVersion)

# Define standard paths, check system configuration.
include(TEMPLATE_NAMESystem)

# Setup build options.
include(TEMPLATE_NAMEOptions)

# Define and enter subdirectories.
add_subdirectory(cmake)
add_subdirectory(libraries)
add_subdirectory(programs)
add_subdirectory(tests)
add_subdirectory(share)
add_subdirectory(doc)

# Output configuration files.
include(TEMPLATE_NAMEDescribe)

# Invoke CPack from here.
include(TEMPLATE_NAMEPackage)

# Generate a report of enabled/disabled features.
feature_summary(WHAT ALL)
