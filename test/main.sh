#!/bin/bash

RED='\033[0;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

TestScriptPath=$(readlink -f "${0}")
TestScriptDir=$(dirname "${TestScriptPath}")

ScriptDir=$(readlink -f "${TestScriptDir}/../")
ScriptName="create.sh"

TestName="PT_Test_Project"
TestDirParent=$(readlink -f "${ScriptDir}/../")
TestDir="${TestDirParent}/${TestName}"

function cleanup()
{
    rm -rf "${TestDir}/"
}

function validate_exit_code()
{
    retval=$?
    if [ $retval != $1 ]; then
        printf "${RED}Error${NC}: script returned: $retval expected: $1\n"
        printf "${RED}Output${NC}: ${2}\n"
        cleanup
        exit 1;
    fi
}

function test_case()
{
    printf "${BLUE}Test${NC}: ${1}\n"
    Output="$($2)"
    validate_exit_code $3 "${Output}"
}

cleanup
trap cleanup EXIT

# Test Cases
test_case "regular script call" \
"${ScriptDir}/${ScriptName} ${TestName} ${TestDirParent}" 0

test_case "no parameter" "${ScriptDir}/${ScriptName}" 1
test_case "one parameter" "${ScriptDir}/${ScriptName} 'a'" 1
test_case "three parameters" "${ScriptDir}/${ScriptName} 'a' 'b' 'c'" 1

cd ${TestDir}/debug/
test_case "Debug build" "ninja" 0
cd ${TestDir}/debug/src/
test_case "Debug run" "./${TestName}" 0

cd ${TestDir}/release/
test_case "Release build" "ninja" 0
cd ${TestDir}/release/src/
test_case "Release run" "./${TestName}" 0


printf "${GREEN}Success${NC}: all tests passed\n"
exit 0
