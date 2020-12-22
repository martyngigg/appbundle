# Create a library wrapped with boost.python
function(add_boostpy_library libraryname entrypoint)
  add_library(${libraryname} SHARED ${entrypoint})
endfunction()

add_boostpy_library(_core _core.cpp)
