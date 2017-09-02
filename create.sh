#!/usr/bin/env bash

if [ $# != 2 ]; then
    printf "Invalid parameter count. Provide 'Name' 'Destination'\n"
    exit 1;
fi

ProjectName=$1
DestinationParent=$(readlink -f "${2}")
Destination="${DestinationParent}/${ProjectName}"

ScriptDir=$(dirname "${0}")
Template=$(readlink -f "${ScriptDir}/template")

cp -r "${Template}" "${DestinationParent}"
mv "${DestinationParent}/template" "${Destination}"

# configure CMake
CM_FILE="${Destination}/CMakeLists.txt"
sed -i.bck -e 's|PN_PLACEHOLDER|'$ProjectName'|' $CM_FILE

rm $CM_FILE.bck

# Init cmake
${Destination}/configure.sh

printf 'Created project "'${ProjectName}'" at location "'${Destination}'"\n'
exit 0
