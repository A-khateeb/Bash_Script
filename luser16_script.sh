#!/bin/bash
#Check if the user is root or not

ARCHIVE_DIR="/archive"
usage(){
  echo "Usage: Script that disables a user account by default" >&2
  echo "-d: Deletes accounts instead of disabling it" >&2
  echo "-r: Removes the home directory of the account selected" >&2
  echo "-a: Creates an archive of the home directory of the user selected" >&2
  exit 1
}
if [[ "${UID}" -ne 0 ]]
then
  echo "This script only runs through root privilages" >&2
  exit 1
fi
echo "Welcome to user management script" >&2
while getopts dra opt
do
  case ${opt} in
    d) DELETE_USER='true' ;;
    r) REMOVE_OPTION='-r' ;;
    a) ARCHIVE='true' ;;
    ?) usage ;;
  esac
done

shift "$((OPTIND -1))"
if [[ "${#}" -lt 1 ]]
then
  usage
fi

for USERNAME in "${@}"
do
  echo "Processing user: ${USERNAME}"
  USERID=$(id -u ${USERNAME})
  if [[ "${USERID}" -lt 1000 ]]
  then
    echo "You cannot delete user ${USERNAME} with UID ${USERID}" >&2
    exit 1
  fi
  if [[ "${ARCHIVE}" = 'ture' ]]
  then
    if [[ ! -d "${ARCHIVE_DIR}" ]]
    then
      echo "Creating ${ARCHIVE_DIR} directory"
      mkdir -p ${ARCHIVE_DIR}
      if [[ "${?}" -ne 0 ]]
      then
        echo " The directory ${ARCHIVE_DIR} was not created successfully" >&2
        exit 1
      fi
    fi
    #Archive Home Directory
    HOME_DIRECTORY="/home/${USERNAME}"
    ARCHIVE_FILE="${ARCHIVE_DIR}/${USERNAME}.tgz"
    if [[ -d "${HOME_DIRECTORY}" ]]
    then
      echo "Archiving ${HOME_DIRECTORY} to ${ARCHIVE_FILE}"
      tar -zcvf ${ARCHIVE_FILE} ${HOME_DIRECTORY}
      if [[ "${?}" -ne 0 ]]
      then
        echo "Could not create ${ARCHIVE_FILE}" >&2
        exit 1
      fi
    else
      echo "${HOME_DIRECTORY} does not exist or is not a directory"
      exit 1
    fi
  fi
  if [[ "${DELETE_USER}" = 'true' ]]
  then
    userdel ${REMOVE_OPTION} ${USERNAME}
  fi
  if [[ "${?}" -ne 0 ]]
  then
    echo "User ${USENAME} was not deleted"
    exit 1
  fi
  echo "The account ${USERNAME} was deleted successfully"
  chage -E 0 ${USERNAME}
  if [[ "${?}" -ne 0 ]]
  then
    echo "User ${USENAME} was not deleted"
    exit 1
  fi
  echo "the account was disabled"
done
exit 0
