#!/bin/bash

RED='\033[0;31m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

function cleanup()
{
    rm -rf $TestDir
}

function check_exit_code()
{
    retval=$?
    if [ $retval != 0 ]; then
        printf "${RED}Error${NC}: script returned: $retval\n"
        cleanup
        exit -1;
    fi
}

ScriptDir=$(readlink -f '../')
ScriptName='create.sh'

TestName='PT_Test_Project'
TestDir='../../PT_Test_Dir'

rm -rf $TestDir


cd $ScriptDir

# Run script
./$ScriptName $TestName $TestDir
check_exit_code


cleanup

printf "${GREEN}Success${NC}: all tests passed\n"
exit 0
