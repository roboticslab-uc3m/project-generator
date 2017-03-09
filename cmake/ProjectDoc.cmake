# Find Doxygen.
find_package(Doxygen)

if(DOXYGEN_FOUND)
  # Specify dox file name.
  set(DOX_FILE Doxyfile)

  # Create "dox" target.
  add_custom_target(dox SOURCES "${CMAKE_SOURCE_DIR}/doc/${DOX_FILE}")

  # Add build rule for "dox" target.
  add_custom_command(TARGET dox
                     COMMAND "${DOXYGEN_EXECUTABLE}" "${CMAKE_SOURCE_DIR}/doc/${DOX_FILE}"
                     COMMENT "Generating doxygen documentation")
endif()

