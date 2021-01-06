# Require core/gui/widgets
find_package(
  Qt5
  COMPONENTS Core Gui Widgets
  REQUIRED)

add_subdirectory(widgets)
