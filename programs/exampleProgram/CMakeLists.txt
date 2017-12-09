# Copyright: Universidad Carlos III de Madrid (C) TEMPLATE_YEAR
# Authors: TEMPLATE_AUTHOR
# CopyPolicy: Released under the terms of the TEMPLATE_LICENSE

if(ENABLE_exampleProgram)

set(KEYWORD "exampleProgram")

# Find YARP.
find_package(YARP REQUIRED)

# Retrieve global include paths and libraries.
get_property(_common_dirs GLOBAL PROPERTY TEMPLATE_NAME_INCLUDE_DIRS)
get_property(_exported_targets GLOBAL PROPERTY TEMPLATE_NAME_TARGETS)

# Define include paths.
include_directories(${YARP_INCLUDE_DIRS}
                    ${_common_dirs})

# Configure executable build target.
add_executable(${KEYWORD} main.cpp
                          ExampleProgram.cpp
                          ExampleProgram.hpp)

# Link external libraries.
target_link_libraries(${KEYWORD} ${YARP_LIBRARIES}
                                 ${_exported_targets})

# Create installation rule.
install(TARGETS ${KEYWORD}
        DESTINATION ${CMAKE_INSTALL_BINDIR}
        COMPONENT example_program)

endif()
