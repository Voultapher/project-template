# Project template
Automate C++ project creation

### Usage
Navigate to this folder and run: `./create.sh ProjectName /folder/destination/`

It should create a project and configure CMake and build-tools

### Template
* `CMakeLists.txt` [cross platform build generator](https://cmake.org/)
* `.editorconfig` [maintain consistent style](http://editorconfig.org/)
* `*.gitignore` ignore build directories
* `compile_commands.json` [use with rtags, a c++ indexer](https://github.com/Andersbakken/rtags)
* `main.cpp` root containing `int main()`
* `README.md` Projcet description
