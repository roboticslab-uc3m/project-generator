# Copyright: Universidad Carlos III de Madrid (C) TEMPLATE_YEAR
# Authors: TEMPLATE_AUTHOR
# CopyPolicy: Released under the terms of the TEMPLATE_LICENSE

if(ENABLE_ExampleLibrary)

set(KEYWORD "ExampleLibrary")

# Configure library build target.
add_library(${KEYWORD} SHARED ExampleLibrary.cpp
                              ExampleLibrary.hpp)

# Link external libraries.
target_link_libraries(${KEYWORD} PUBLIC YARP::YARP_OS)

# Create installation rule.
install(TARGETS ${KEYWORD}
        EXPORT TEMPLATE_NAME
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT example_library
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT example_library
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT example_library)

# Export current target.
set_property(GLOBAL APPEND PROPERTY TEMPLATE_NAME_TARGETS ${KEYWORD})

endif()
