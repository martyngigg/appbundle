#include "core/version.hpp"

#include <boost/python/def.hpp>
#include <boost/python/module.hpp>

BOOST_PYTHON_MODULE(_core) {
  using namespace boost::python;

  def("version_string", framework::core::version_string);
}