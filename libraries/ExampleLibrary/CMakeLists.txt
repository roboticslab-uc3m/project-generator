set(KEYWORD "ExampleLibrary")

# Find YARP.
find_package(YARP REQUIRED)

# Add current directory to global include paths, retrieve current values.
set_property(GLOBAL APPEND PROPERTY TEMPLATE_NAME_INCLUDE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}")
get_property(TEMPLATE_NAME_INCLUDE_DIRS GLOBAL PROPERTY TEMPLATE_NAME_INCLUDE_DIRS)

# Define include paths.
include_directories(${YARP_INCLUDE_DIRS} ${TEMPLATE_NAME_INCLUDE_DIRS})

# Configure library build target.
add_library(${KEYWORD} ExampleLibrary.cpp ExampleLibrary.hpp)

# Link external libraries.
target_link_libraries(${KEYWORD} LINK_PRIVATE ${YARP_LIBRARIES})

# Create installation rule.
install(TARGETS ${KEYWORD}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

# Export library name, store include paths in target.
set_property(GLOBAL APPEND PROPERTY TEMPLATE_NAME_LIBRARIES ${KEYWORD})
set_property(TARGET ${KEYWORD} PROPERTY INCLUDE_DIRS ${TEMPLATE_NAME_INCLUDE_DIRS})

