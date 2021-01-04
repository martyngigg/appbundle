# Build C++-library wrappers
add_boostpy_library(_core src/_core.cpp)
target_link_libraries(_core PRIVATE core)
install(TARGETS _core DESTINATION ${CMAKE_INSTALL_LIBDIR}/framework)
