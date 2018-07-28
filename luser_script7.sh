#!/bin/bash

#Make sure the script is run through with a superuser account
UID_TO_TEST=0
if [[ ${UID} == ${UID_TO_TEST} ]]
then
  echo "Welcome to user add script"
else
  echo "Please contact the root user"
  exit 1
fi

if [[ ${#} -lt 1 ]]
then
  echo "Usage: ${0} USER_NAME [COMMENT]..."
  exit 1
fi
#The First parameter
USER_NAME="${1}"
#The rest is comment
shift
COMMENT="${@}"
PASSWORD=$(date +%s%N | sha256sum | head -c48)
useradd -c "${COMMENT}" -m ${USER_NAME}
if [[ "${?}" -ne 0 ]]
then
  echo "The account could not be created!"
  exit
fi
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then
  echo "THe password for your account could not be set"
  exit 1
fi
passwd -e ${USER_NAME}
echo
echo "Username:"
echo ${USER_NAME}
echo
echo
echo "Password:"
echo ${PASSWORD}
echo
echo
echo "Host:"
echo ${HOSTNAME}
echo
tail -5 /etc/passwd
