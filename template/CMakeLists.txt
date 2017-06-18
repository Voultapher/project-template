cmake_minimum_required (VERSION 3.7)
project (PN_PLACEHOLDER VERSION 0.1 LANGUAGES CXX)

add_subdirectory(src)
add_subdirectory(test)

add_executable (${PROJECT_NAME} "${SRC_DIR}/main.cpp")
target_include_directories(${PROJECT_NAME} INTERFACE include)
target_compile_features(${PROJECT_NAME} INTERFACE
  -Wall
)
