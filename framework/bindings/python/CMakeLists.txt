find_package(
  Boost
  COMPONENTS python
  REQUIRED)

# Create a library wrapped with boost.python
function(add_boostpy_library libraryname entrypoint)
  add_library(${libraryname} SHARED ${entrypoint})
  target_link_options(${libraryname} PRIVATE -undefined dynamic_lookup)
  set_target_properties(${libraryname} PROPERTIES PREFIX "")
  if(CMAKE_SYSTEM_NAME MATCHES "Darwin")
    set_target_properties(${libraryname} PROPERTIES SUFFIX ".so")
  endif()
  target_include_directories(${libraryname} PRIVATE ${Python_INCLUDE_DIRS})
  target_link_libraries(${libraryname} PRIVATE Boost::python)
endfunction()

add_subdirectory(framework)
install(
  DIRECTORY framework
  TYPE LIB
  PATTERN "__pycache__/*" EXCLUDE
  PATTERN "src/*" EXCLUDE)
