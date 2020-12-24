# TODO: This needs
find_package(
  Boost
  COMPONENTS python-py36
  REQUIRED)

# Create a library wrapped with boost.python
function(add_boostpy_library libraryname entrypoint)
  add_library(${libraryname} SHARED ${entrypoint})
  set_target_properties(${libraryname} PROPERTIES PREFIX "")
  target_link_libraries(${libraryname} PRIVATE Boost::python-py36)
endfunction()

add_boostpy_library(_core _core.cpp)
