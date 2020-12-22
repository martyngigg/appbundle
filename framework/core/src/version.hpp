#pragma once

#include <string_view>

namespace framework::core {

// Return the version of the framework as a string
constexpr std::string_view version_string();

} // namespace framework::core