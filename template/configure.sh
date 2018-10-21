#!/usr/bin/env bash

set -e

SCRIPT_FILE=$(readlink -f ${0})
SCRIPT_PATH=$(dirname ${SCRIPT_FILE})

mkdir -p "${SCRIPT_PATH}/debug"
cd "${SCRIPT_PATH}/debug"
cmake -G Ninja \
  -D CMAKE_C_COMPILER=clang \
  -D CMAKE_CXX_COMPILER=clang++ \
  -D CMAKE_CXX_FLAGS="-Wall -Wextra -stdlib=libc++ -fno-rtti -fsanitize=address,undefined -fno-omit-frame-pointer -fcolor-diagnostics" \
  -D CMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld" \
  -D CMAKE_MODULE_LINKER_FLAGS="-fuse-ld=lld" \
  -D CMAKE_SHARED_LINKER_FLAGS="-fuse-ld=lld" \
  -D CMAKE_BUILD_TYPE=Debug \
  -D CMAKE_EXPORT_COMPILE_COMMANDS=1 ..

mkdir -p "${SCRIPT_PATH}/release"
cd "${SCRIPT_PATH}/release"
cmake -G Ninja \
  -D CMAKE_C_COMPILER=clang \
  -D CMAKE_CXX_COMPILER=clang++ \
  -D CMAKE_CXX_FLAGS="-stdlib=libc++ -fno-rtti -flto=thin -fcolor-diagnostics" \
  -D CMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld" \
  -D CMAKE_MODULE_LINKER_FLAGS="-fuse-ld=lld" \
  -D CMAKE_SHARED_LINKER_FLAGS="-fuse-ld=lld" \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_EXPORT_COMPILE_COMMANDS=1 ..
