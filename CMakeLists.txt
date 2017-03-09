# Copyright: Universidad Carlos III de Madrid (C) TEMPLATE_YEAR;
# Authors: TEMPLATE_AUTHOR
# CopyPolicy: Released under the terms of the GNU GPL v2.0.

# Exploit new cmake 2.6 features (export). 

# reduce warning level with cmake 2.6
cmake_minimum_required(VERSION 2.6)
#cmake policies
if(COMMAND cmake_policy)
  cmake_policy(SET CMP0003 NEW)
endif(COMMAND cmake_policy)

project(TEMPLATE_NAME)

######################

# Pick up our cmake modules - they are all in the cmake subdirectory
set(TEMPLATE_NAME_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
# let cmake use them
list(APPEND CMAKE_MODULE_PATH ${TEMPLATE_NAME_MODULE_PATH})

include(TEMPLATE_PASCALOptions)
include(TEMPLATE_PASCALSystem)

set(TEMPLATE_NAME_INCLUDE_DIRS CACHE INTERNAL "appended header dirs" FORCE)
set(TEMPLATE_NAME_LINK_DIRS CACHE INTERNAL "appended link dirs" FORCE)
set(TEMPLATE_NAME_LIBRARIES CACHE INTERNAL "appended libraries" FORCE)

# add main contents
add_subdirectory(share)
add_subdirectory(libraries)
add_subdirectory(programs)

include(TEMPLATE_PASCALDescribe)

