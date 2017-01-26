#!/bin/bash

ScriptDir=$(readlink -f '../')
ScriptName='create.sh'

TestName='PT_Test_Project'
TestDir='../../PT_Test_Dir'

rm -rf $TestDir

cd $ScriptDir
./$ScriptName $TestName $TestDir


echo 'all tests passed'
exit 0
