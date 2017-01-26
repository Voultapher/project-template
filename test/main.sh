#!/bin/bash

RED='\033[0;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

function cleanup()
{
    rm -rf $TestDir
}

function validate_exit_code()
{
    retval=$?
    if [ $retval != $1 ]; then
        printf "${RED}Error${NC}: script returned: $retval expected: $1\n"
        printf "${RED}Output${NC}: ${2}\n"
        cleanup
        exit -1;
    fi
}

function test_case()
{
    printf "${BLUE}Test${NC}: ${1}\n"
    Output="$(./$2)"
    validate_exit_code $3 "$Output"
}

ScriptDir=$(readlink -f '../')
ScriptName='create.sh'

TestName='PT_Test_Project'
TestDir='../../PT_Test_Dir'
cleanup

cd $ScriptDir

# Test Cases
test_case "regular script call" "$ScriptName $TestName $TestDir" 0
test_case "no parameter" "./$ScriptName" 1
test_case "one parameter" "./$ScriptName 'a'" 1
test_case "three parameters" "./$ScriptName 'a' 'b' 'c'" 1

cleanup

printf "${GREEN}Success${NC}: all tests passed\n"
exit 0
