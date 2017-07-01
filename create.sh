#!/bin/bash

if [ $# != 2 ]; then
    printf 'Invalid parameter count. Provide "Name" "Destination"\n'
    exit 1;
fi

ProjectName=$1
Destination=$(readlink -f $2)
Source='template/.'

cp -r $Source $Destination

# configure atom-build-tools
BT_FILE=$Destination/.build-tools.cson
sed -i.bck -e 's|PROJECT_NAME|'$ProjectName'|' $BT_FILE
sed -i.bck -e 's|project: ""|project: "'$Destination'"|' $BT_FILE
sed -i.bck -e 's|source: ""|source: "'$BT_FILE'"|' $BT_FILE

rm $BT_FILE.bck

# configure CMake
CM_FILE=$Destination/CMakeLists.txt
sed -i.bck -e 's|PN_PLACEHOLDER|'$ProjectName'|' $CM_FILE

rm $CM_FILE.bck

# Init cmake
cd $Destination/Debug
cmake -G Ninja \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_CXX_FLAGS="-Wall -Wextra" \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..

cd $Destination/Release
cmake -G Ninja \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..

printf 'Created project "'$ProjectName'" at location "'$Destination'"\n'
exit 0
