#!/bin/bash
#This script deletes a user

#Run as a root
 if [[ "$UID" -ne 0 ]]
 then
   echo "Please make sure to run the script as a root" >%2
   exit 1
 fi

#Assume the first Argument is the user to delete
USER="${1}"
#Delete the user
userdel ${USER}
#Make sure the user got deleted
if [[ "${?}" -ne 0 ]]
then
  echo "The account ${USER} was not deleted" >&2
  exit 1
fi
#Tell the user the account was deleted
echo "The account is now deleted!"
exit 0
