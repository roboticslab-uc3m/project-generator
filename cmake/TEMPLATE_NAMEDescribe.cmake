# Store the package in the user registry.
export(PACKAGE TEMPLATE_NAME)

# Retrieve global properties.
get_property(_common_includes GLOBAL PROPERTY TEMPLATE_NAME_INCLUDE_DIRS)
get_property(_exported_targets GLOBAL PROPERTY TEMPLATE_NAME_TARGETS)

# CMake installation path.
if(WIN32)
    set(_cmake_destination cmake)
else()
    set(_cmake_destination ${CMAKE_INSTALL_LIBDIR}/cmake/TEMPLATE_NAME)
endif()

# Create and install config files.
include(CMakePackageConfigHelpers)

# Set exported variables (build tree).
set(TEMPLATE_NAME_INCLUDE_DIR ${_common_includes})
set(TEMPLATE_NAME_MODULE_DIR ${CMAKE_SOURCE_DIR}/cmake)

# <pkg>Config.cmake (build tree).
configure_package_config_file(${CMAKE_SOURCE_DIR}/cmake/template/TEMPLATE_NAMEConfig.cmake.in
                              ${CMAKE_BINARY_DIR}/TEMPLATE_NAMEConfig.cmake
                              INSTALL_DESTINATION ${CMAKE_BINARY_DIR}
                              INSTALL_PREFIX ${CMAKE_BINARY_DIR}
                              PATH_VARS TEMPLATE_NAME_INCLUDE_DIR
                                        TEMPLATE_NAME_MODULE_DIR
                              NO_CHECK_REQUIRED_COMPONENTS_MACRO)

# Set exported variables (install tree).
set(TEMPLATE_NAME_INCLUDE_DIR ${CMAKE_INSTALL_INCLUDEDIR})
set(TEMPLATE_NAME_MODULE_DIR ${CMAKE_INSTALL_DATADIR}/TEMPLATE_NAME/cmake)

# <pkg>Config.cmake (install tree).
configure_package_config_file(${CMAKE_SOURCE_DIR}/cmake/template/TEMPLATE_NAMEConfig.cmake.in
                              ${CMAKE_BINARY_DIR}/TEMPLATE_NAMEConfig.cmake.install
                              INSTALL_DESTINATION ${_cmake_destination}
                              PATH_VARS TEMPLATE_NAME_INCLUDE_DIR
                                        TEMPLATE_NAME_MODULE_DIR
                              NO_CHECK_REQUIRED_COMPONENTS_MACRO)

# Install <pkg>Config.cmake.
install(FILES ${CMAKE_BINARY_DIR}/TEMPLATE_NAMEConfig.cmake.install
        RENAME TEMPLATE_NAMEConfig.cmake
        DESTINATION ${_cmake_destination})

# Export library targets if enabled.
# https://github.com/roboticslab-uc3m/project-generator/issues/19
if(_exported_targets)
    # <pkg>Targets.cmake (build tree).
    # In CMake 3.0 or later: export(EXPORT TEMPLATE_NAME...)
    export(TARGETS ${_exported_targets}
           NAMESPACE TEMPLATE_CM_NAMESPACE::
           FILE TEMPLATE_NAMETargets.cmake)

    # <pkg>Targets.cmake (install tree).
    install(EXPORT TEMPLATE_NAME
            DESTINATION ${_cmake_destination}
            NAMESPACE TEMPLATE_CM_NAMESPACE::
            FILE TEMPLATE_NAMETargets.cmake)
endif()

# Configure and create uninstall target (YCM).
include(AddUninstallTarget)
