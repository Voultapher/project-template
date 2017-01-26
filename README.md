# Project template
Automate C++ project creation

### Usage
Navigate to this folder and run: `./create.sh ProjectName /folder/destination/`

It should create a project and configure CMake and build-tools

### Template
* `CMakeLists.txt` [cross platform build generator](https://cmake.org/)
* `.editorconfig` [maintain consistent style](http://editorconfig.org/)
* `.build-tools.cson` [direct building and running inside atom](https://atom.io/packages/build-tools)
* `main.cpp` root containing `int main()`
