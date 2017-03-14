# Copyright: Universidad Carlos III de Madrid (C) TEMPLATE_YEAR
# Authors: TEMPLATE_AUTHOR
# CopyPolicy: Released under the terms of the TEMPLATE_LICENSE

find_package(YARP REQUIRED)
list(APPEND CMAKE_MODULE_PATH ${YARP_MODULE_PATH})
include(YarpInstallationHelpers)
yarp_configure_external_installation(TEMPLATE_LOWER)

### Go through single applications

#add_subdirectory(prog)

