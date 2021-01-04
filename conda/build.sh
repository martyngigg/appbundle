#!/bin/bash
set -ex

# Dump environment
env

UNAME_SYSNAME="$(uname -s)"
echo "Building on ${UNAME_SYSNAME}"
case "${UNAME_SYSNAME}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE=Linux
esac

CMAKE_EXTRA_ARGS=
if [ "${MACHINE}" = "Mac" ]; then
  if [ -z "${CONDA_BUILD_SYSROOT}" ]; then
    CONDA_BUILD_SYSROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk
  fi
  CMAKE_EXTRA_ARGS="-DCMAKE_OSX_SYSROOT=${CONDA_BUILD_SYSROOT}"
fi

mkdir -p build && cd build
cmake \
  -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_SHARED_LIBS=ON \
  -DCMAKE_PREFIX_PATH=${CONDA_PREFIX} \
  -DCMAKE_INSTALL_PREFIX=${CONDA_PREFIX} \
  ${CMAKE_EXTRA_ARGS} ..

# Dump cmake variables
cmake -B . -S .. -LA

cmake --build .
cmake --install .

# Move Python package to the final destination
mv "${CONDA_PREFIX}/lib/framework" "${SP_DIR}"
