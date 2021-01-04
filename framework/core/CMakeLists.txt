include(GenerateExportHeader)

# Create a library target for a framework library
function(add_framework_library targetname)
  add_library(${targetname} ${ARGN})
  generate_export_header(${targetname})
  target_include_directories(
    ${targetname} PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>)
endfunction()

set(SRCS version.cpp)
add_framework_library(core ${SRCS})
target_include_directories(
  core INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/..>)
