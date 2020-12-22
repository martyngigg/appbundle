# Create a library target for a framework library
function(add_framework_library targetname)
  add_library(${targetname} ${ARGN})
endfunction()

set(SRC src/version.cpp)
add_framework_library(core ${SRC})
