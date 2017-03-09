# export our variables to a TEMPLATE_NAMEConfig.cmake creation
set(TEMPLATE_NAME_LINK_DIRS ${TEMPLATE_NAME_LINK_DIRS} ${LIBRARY_OUTPUT_PATH})
configure_file(${CMAKE_SOURCE_DIR}/cmake/template/TEMPLATE_NAMEConfig.cmake.in
               ${CMAKE_BINARY_DIR}/TEMPLATE_NAMEConfig.cmake @ONLY)

# create a symbolic link to the shared directory (as contains models and may be heavy)
# If you want a deep copy, you can use the copy_directory command instead of create_symlink.
#add_custom_target(install_applications COMMAND ${CMAKE_COMMAND} -E create_symlink ${CMAKE_SOURCE_DIR}/share ${CMAKE_SOURCE_DIR}/../share)

#endif(MSVC)
##add_custom_target(nuke
##  "${CMAKE_COMMAND}" -E "remove_directory" "${CMAKE_SOURCE_DIR}/bin" ";"
##  "${CMAKE_COMMAND}" -E "remove_directory" "${CMAKE_SOURCE_DIR}/lib")

# uninstall target
configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake/template/TEMPLATE_NAMEConfigUninstall.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/TEMPLATE_NAMEConfigUninstall.cmake" IMMEDIATE @ONLY)

add_custom_target(uninstall
    COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_BINARY_DIR}/TEMPLATE_NAMEConfigUninstall.cmake)

