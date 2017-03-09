### options: cpp libraries
option(ENABLE_ExampleLibrary "Choose if you want to compile ExampleLibrary" TRUE)

### options: cpp programs
option(ENABLE_exampleProgram "Choose if you want to compile exampleProgram" TRUE)

### options: force default
option(ENABLE_exampleExtraOption "Enable/disable option exampleExtraOption" TRUE)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING 
     "Choose the type of build, recommanded options are: Debug or Release")
endif()

# Hide variable to MSVC users, since it is not needed
if(MSVC)
  mark_as_advanced(CMAKE_BUILD_TYPE)
endif()

