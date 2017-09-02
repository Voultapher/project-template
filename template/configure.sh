#!/usr/bin/env bash

SCRIPT_FILE=$(readlink -f ${0})
SCRIPT_PATH=$(dirname ${SCRIPT_FILE})

cd "${SCRIPT_PATH}/Debug"
cmake -G Ninja \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_CXX_FLAGS="-Wall -Wextra" \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..

cd "${SCRIPT_PATH}/Release"
cmake -G Ninja \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
