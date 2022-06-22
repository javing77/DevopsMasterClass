#!/bin/sh

Name=$1
LastName=$2
Age=$3
Visible=$4

if [ $Visible == "true" ]; then
    echo Your name is $Name $LastName and you are $Age years old.
else
    echo "Pass visible parameter as 1 to see the output"
fi

