# Find Boost Python
find_package(
  Boost
  COMPONENTS python${Python_VERSION_MAJOR}${Python_VERSION_MINOR}
  REQUIRED)

add_subdirectory(framework)
