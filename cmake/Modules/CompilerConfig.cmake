# ------------------------------------------------------------------------------
# Top-level compiler configuration script
#
# Performs a check for the required minimum version of the compiler and
# delegates the actual configuration to the appropriate file in the compilers
# subdirectory
# ------------------------------------------------------------------------------

# Required C++17 minimum.
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED OFF)
set(CMAKE_CXX_EXTENSIONS OFF)

# Visibility hidden
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_VISIBILITY_INLINES_HIDDEN 1)

# GCC >= 7.0
if(
  CMAKE_CXX_COMPILER_ID STREQUAL "GNU"
  AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 7.0
)
  message(FATAL_ERROR "GCC 7.0 or later is required.")
else()
  include(Compilers/GNUConfig)
endif()