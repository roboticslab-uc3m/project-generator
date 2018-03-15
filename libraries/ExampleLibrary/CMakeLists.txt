# Copyright: Universidad Carlos III de Madrid (C) TEMPLATE_YEAR
# Authors: TEMPLATE_AUTHOR
# CopyPolicy: Released under the terms of the TEMPLATE_LICENSE

if(ENABLE_ExampleLibrary)

set(KEYWORD "ExampleLibrary")

# Find YARP.
find_package(YARP REQUIRED)

# Add current directory to global include paths, retrieve current values.
set_property(GLOBAL APPEND PROPERTY TEMPLATE_NAME_INCLUDE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}")
get_property(_common_dirs GLOBAL PROPERTY TEMPLATE_NAME_INCLUDE_DIRS)

# Define include paths.
include_directories(${YARP_INCLUDE_DIRS}
                    ${_common_dirs})

# Configure library build target.
add_library(${KEYWORD} ExampleLibrary.cpp
                       ExampleLibrary.hpp)

# Link external libraries.
target_link_libraries(${KEYWORD} LINK_PUBLIC ${YARP_LIBRARIES})

# Create installation rule.
install(TARGETS ${KEYWORD}
        EXPORT TEMPLATE_NAME
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT example_library
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT example_library
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT example_library)

# Export current target.
set_property(GLOBAL APPEND PROPERTY TEMPLATE_NAME_TARGETS ${KEYWORD})

endif()
