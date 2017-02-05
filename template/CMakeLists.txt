cmake_minimum_required (VERSION 2.8.9)
project (PN_PLACEHOLDER)

set (PN_PLACEHOLDER_VERSION_MAJOR 1)
set (PN_PLACEHOLDER_VERSION_MINOR 0)

set (INCLUDE_DIR "${PROJECT_SOURCE_DIR}/include")
set (SRC_DIR "${PROJECT_SOURCE_DIR}/src")

include_directories (${INCLUDE_DIR})

set (CMAKE_C_FLAGS_DEBUG "-O0 -g -Wall")
set (CMAKE_CXX_FLAGS_DEBUG "-O0 -g -std=c++14 -Wall")

set (CMAKE_C_FLAGS_RELEASE "-O3 -Wall")
set (CMAKE_CXX_FLAGS_RELEASE "-O3 -std=c++14 -Wall")

add_executable (${PROJECT_NAME} "${SRC_DIR}/main.cpp")

# Atom linter-clang config
FILE (WRITE ".clang_complete" "-I${INCLUDE_DIR}")
