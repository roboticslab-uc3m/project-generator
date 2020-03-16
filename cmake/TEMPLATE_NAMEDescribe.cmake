# Store the package in the user registry.
set(CMAKE_EXPORT_PACKAGE_REGISTRY ON)

# Retrieve global properties.
get_property(_exported_targets GLOBAL PROPERTY TEMPLATE_NAME_TARGETS)

if(NOT DEFINED _exported_targets)
    set(_no_export NO_EXPORT)
endif()

# Store the package in the user registry.
set(CMAKE_EXPORT_PACKAGE_REGISTRY ON)

# Create and install config files.
include(InstallBasicPackageFiles)

install_basic_package_files(TEMPLATE_NAME
                            COMPATIBILITY AnyNewerVersion
                            ${_no_export}
                            NO_SET_AND_CHECK_MACRO
                            NO_CHECK_REQUIRED_COMPONENTS_MACRO
                            NAMESPACE ROBOTICSLAB::)

# Configure and create uninstall target (YCM).
include(AddUninstallTarget)
