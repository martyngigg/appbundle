function(add_qt_library targetname)
  add_library(${targetname} ${ARGN})
  set_property(TARGET ${targetname} PROPERTY AUTOMOC ON)
  target_link_libraries(${targetname} PUBLIC Qt5::Widgets)
  install(TARGETS ${targetname})
endfunction()

set(SRCS src/frameworkaboutwidget.cpp)

add_qt_library(widgets ${SRCS})
target_link_libraries(widgets PRIVATE core)
