# ------------------------------------------------------------------------------
# Configuration options for GCC
# ------------------------------------------------------------------------------
set(GCC_COMPILER_VERSION
    ${CMAKE_CXX_COMPILER_VERSION}
    CACHE INTERNAL "")
message(STATUS "gcc version: ${GCC_COMPILER_VERSION}")

# Addtional warnings for GCC
set(CMAKE_CXX_FLAGS_WARN
    "\
-Wnon-virtual-dtor \
-Wcast-align \
-Wchar-subscripts \
-Wall \
-Wextra \
-Wpointer-arith \
-Wformat-security \
-Woverloaded-virtual \
-Wshadow \
-Wunused-parameter \
-fno-check-new \
-fno-common")

include(CheckCXXCompilerFlag)

# This flag is useful as not returning from a non-void function is an error with
# MSVC, but it is not supported on all GCC compiler versions
check_cxx_compiler_flag(-Werror=return-type HAVE_GCC_ERROR_RETURN_TYPE)
if(HAVE_GCC_ERROR_RETURN_TYPE)
  set(CMAKE_CXX_FLAGS_ERROR "-Werror=return-type")
endif()

# Set extra warning flags in debug modes
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO
    "${CMAKE_CXX_FLAGS_RELWITHDEBINFO} ${CMAKE_CXX_FLAGS_WARN}")
set(CMAKE_CXX_FLAGS_DEBUG
    "${CMAKE_CXX_FLAGS_DEBUG} ${CMAKE_CXX_FLAGS_WARN} ${CMAKE_CXX_FLAGS_ERROR}")
set(CMAKE_LINKER_FLAGS_DEBUG "${CMAKE_LINKER_FLAGS_DEBUG}")
