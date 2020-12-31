# Create a library target for a framework library
function(add_framework_library targetname)
  add_library(${targetname} ${ARGN})
endfunction()

set(SRCS version.cpp)
add_framework_library(core ${SRCS})
target_include_directories(
  core INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/..>)
