#!/usr/bin/env bash

if [ $# != 2 ]; then
    printf "Invalid parameter count. Provide 'Name' 'Destination'\n"
    exit 1
fi

set -euo pipefail

ProjectName=$1
DestinationParent=$(realpath "${2}")
Destination="${DestinationParent}/${ProjectName}"

ScriptDir=$(dirname "${0}")
Template=$(realpath "${ScriptDir}/template")

cp -r "${Template}" "${DestinationParent}"
mv "${DestinationParent}/template" "${Destination}"

# configure CMake
CM_FILE="${Destination}/CMakeLists.txt"
sed -i.bck -e 's|PN_PLACEHOLDER|'$ProjectName'|' $CM_FILE

rm $CM_FILE.bck

# Init cmake
if [[ "${OSTYPE}" == "linux-gnu" ]]; then
    cp ${Destination}/toolchains/configure-x64-linux.sh ${Destination}/configure.sh
elif [[ "${OSTYPE}" == "darwin"* ]]; then
    cp ${Destination}/toolchains/configure-x64-macos.sh ${Destination}/configure.sh
else
    printf "Sorry ${OSTYPE} is currenly not supported\n"
    printf "Try adapting a toolchain configure script for your platform\n"
    exit 1
fi

${Destination}/configure.sh

printf 'Created project "'${ProjectName}'" at location "'${Destination}'"\n'
exit 0
