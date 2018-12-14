# Copyright: Universidad Carlos III de Madrid (C) TEMPLATE_YEAR
# Authors: TEMPLATE_AUTHOR
# CopyPolicy: Released under the terms of the TEMPLATE_LICENSE

if(ENABLE_ExampleLibrary)

set(KEYWORD "ExampleLibrary")

# Configure library build target.
add_library(${KEYWORD} SHARED ExampleLibrary.cpp
                              ExampleLibrary.hpp)

# Set project properties.
set_target_properties(${KEYWORD} PROPERTIES PUBLIC_HEADER "ExampleLibrary.hpp")

# Link external libraries.
target_link_libraries(${KEYWORD} PUBLIC YARP::YARP_OS
                                 PRIVATE ROBOTICSLAB::ColorDebug)

# Define include paths.
target_include_directories(${KEYWORD} PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
                                             $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

# Create installation rule.
install(TARGETS ${KEYWORD}
        EXPORT TEMPLATE_NAME
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT example_library
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT example_library
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT example_library
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR} COMPONENT example_library)

# Export current target.
set_property(GLOBAL APPEND PROPERTY TEMPLATE_NAME_TARGETS ${KEYWORD})

endif()
