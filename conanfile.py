from conans import ConanFile

import os

# Target Python version
PYTHON_VERSION_MAJOR = 3
PYTHON_VERSION_MINOR = 8
PYTHON_VERSION_PATCH = 0


class AppBundleConan(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    requires = [
         f"Python/{PYTHON_VERSION_MAJOR}.{PYTHON_VERSION_MINOR}.{PYTHON_VERSION_PATCH}"
    ]
    generators = "cmake"
    default_options = {
        "*:shared": True,
        "boost_python:python_version": f"{PYTHON_VERSION_MAJOR}.{PYTHON_VERSION_MINOR}"
    }

    def imports(self):
        self.copy("python*", dst="bin", src="bin")
        self.copy("*.so*", dst="lib", src="lib")
        self.copy(f"python{PYTHON_VERSION_MAJOR}.{PYTHON_VERSION_MINOR}/*", dst="lib", src="lib")

    def requirements(self):
        print(self)
