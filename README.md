# Project template
Automate C++ project creation

### Usage
Generate new project like this: `./create.sh project-name /destination/path`

This should create a project and configure CMake and build-tools.

### Template
* `CMakeLists.txt` [cross platform build generator](https://cmake.org/)
* `.editorconfig` [maintain consistent style](http://editorconfig.org/)
* `*.gitignore` ignore build directories
* `compile_commands.json` [use with tools like rtags, a C++ indexer](https://github.com/Andersbakken/rtags)
* `main.cpp` root containing `int main()`
* `README.md` Project description
