# Copyright: Universidad Carlos III de Madrid (C) TEMPLATE_YEAR
# Authors: TEMPLATE_AUTHOR
# CopyPolicy: Released under the terms of the TEMPLATE_LICENSE

set(KEYWORD "exampleProgram")

# Find YARP.
find_package(YARP REQUIRED)

# Retrieve global include paths and libraries.
get_property(TEMPLATE_NAME_INCLUDE_DIRS GLOBAL PROPERTY TEMPLATE_NAME_INCLUDE_DIRS)
get_property(TEMPLATE_NAME_LIBRARIES GLOBAL PROPERTY TEMPLATE_NAME_LIBRARIES)

# Define include paths.
include_directories(${YARP_INCLUDE_DIRS} ${TEMPLATE_NAME_INCLUDE_DIRS})

# Configure executable build target.
add_library(${KEYWORD} main.cpp ExampleProgram.cpp ExampleProgram.hpp)

# Link external libraries.
target_link_libraries(${KEYWORD} ${YARP_LIBRARIES} ${TEMPLATE_NAME_LIBRARIES})

# Create installation rule.
install(TARGETS ${_example_target}
        DESTINATION ${CMAKE_INSTALL_BINDIR}
        COMPONENT example_program)

