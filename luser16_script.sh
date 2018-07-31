#!/bin/bash
#Check if the user is root or not
if [[ "${UID}" -ne 0 ]]
then
  echo "This script only runs through root privilages" >&2
  exit 1
fi

usage(){
  echo "Usage: Script that disables a user account by default" >&2
  echo "-d: Deletes accounts instead of disabling it" >&2
  echo "-r: Removes the home directory of the account selected" >&2
  echo "-a: Creates an archive of the home directory of the user selected" >&2
  exit 1
}
delete_account(){
  for USERNAME in "${@}"
  do
    echo "Processing user: ${USERNAME}"
    USERID=$(id -u ${USERNAME})
    if [[ "${USERID}" -lt 1000 ]]
    then
      echo "You cannot delete a user "
		fi
	done
  if [[ ${?} -ne 0 ]]
  then
    echo "The user was not deleted" >&2
    exit 1
	else
		echo "Account was deleted"
  fi
}
remove_account(){
  echo "Remove account function"

}
archive_home(){
  echo "archive home function"

}
echo "Welcome to user management script" >&2
while getopts ":dra" opt; do
  case ${opt} in
    d)
    echo "Deleting the account"
    delete_account
    ;;
    r)
    echo "Removing home directory of the user"
    remove_account
    ;;
    a)
    echo "Archiving home directory of the user"
    archive_home
    ;;
    ?)
    usage
    ;;
  esac
done
#Remove options
shift "$((OPTIND -1))"
if [[ "${#}" -lt 1 ]]
then
  usage
fi
exit 0
