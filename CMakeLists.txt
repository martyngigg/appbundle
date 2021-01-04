cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
foreach(
  p
  CMP0020 # Automatically link Qt executables to qtmain target on Windows.
  CMP0022 # INTERFACE_LINK_LIBRARIES defines the link interface.
  CMP0025 # Compiler id for Apple Clang is now AppleClang.
  CMP0053 # Simplify variable reference and escape sequence evaluation.
  CMP0054 # Only interpret if() arguments as variables or keywords when
          # unquoted.
)
  if(POLICY ${p})
    cmake_policy(SET ${p} NEW)
  endif()
endforeach()

project(appbundle LANGUAGES C CXX)

# Our CMake modules
list(INSERT CMAKE_MODULE_PATH 0
     "${${CMAKE_PROJECT_NAME}_SOURCE_DIR}/cmake/Modules")

# Default output to lib/bin directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)

# Compiler configuration
include(CompilerConfig)

# Code
add_subdirectory(framework)
