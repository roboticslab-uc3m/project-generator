# Store the package in the user registry.
export(PACKAGE TEMPLATE_NAME)

# Retrieve global properties.
get_property(TEMPLATE_NAME_INCLUDE_DIRS GLOBAL PROPERTY TEMPLATE_NAME_INCLUDE_DIRS)
get_property(TEMPLATE_NAME_LIBRARIES GLOBAL PROPERTY TEMPLATE_NAME_LIBRARIES)
get_property(TEMPLATE_NAME_TARGETS GLOBAL PROPERTY TEMPLATE_NAME_TARGETS)

# Set build/install pairs of paths for each exported property.
set(TEMPLATE_NAME_BUILD_INCLUDE_DIRS ${TEMPLATE_NAME_INCLUDE_DIRS})
set(TEMPLATE_NAME_INSTALL_INCLUDE_DIRS ${CMAKE_INSTALL_FULL_DATADIR}/TEMPLATE_LOWER/cmake)

# Create and install config and version files (YCM).
include(InstallBasicPackageFiles)

install_basic_package_files(TEMPLATE_NAME
                            VERSION ${TEMPLATE_NAME_VERSION_SHORT}
                            COMPATIBILITY AnyNewerVersion
                            TARGETS_PROPERTY TEMPLATE_NAME_TARGETS
                            NO_CHECK_REQUIRED_COMPONENTS_MACRO
                            EXTRA_PATH_VARS_SUFFIX INCLUDE_DIRS)

# Configure and create uninstall target (YCM).
include(AddUninstallTarget)

