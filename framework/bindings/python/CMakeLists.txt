# Python + Boost Python
find_package(
  Python
  COMPONENTS Interpreter Development
  REQUIRED)
find_package(
  Boost
  COMPONENTS python NO_DEFAULT_PATH
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
add_custom_target(
  framework_setup_develop ALL
  BYPRODUCTS ${Python_SITELIB}/framework.egg-link
  COMMAND ${Python_EXECUTABLE} setup.py develop
  DEPENDS _core
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  COMMENT "Generating framework egg link in ${Python_SITELIB}")
