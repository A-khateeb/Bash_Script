#!/bin/bash 
echo "Your UID is ${EUID}"

USER_NAME=`id -un`
echo "Username is ${USER_NAME}"
if [[ "$UID" -eq 0 ]]
then
   echo "You are root"
else
   echo "You are not root"
fi
