#!/bin/bash
log() {
	#This function sends a mesage to SYSLOG and to standard output if verbose is true
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${MESSAGE}"
	fi
	logger -t luser13_script.sh "${MESSAGE}"
}
backup_FILE(){
	local FILE="${1}"
	if [[ -f "${FILE}" ]]
	then
		local backup_FILE="/var/tmp/$(basename $FILE).$(date +%F-%N)"
		log "backing up ${FILE} to ${backup_FILE}"
		cp -p ${FILE} ${backup_FILE}
	else
		return 1
	fi
}
readonly VERBOSE="true"
log "Hi"
log "This is fun"
backup_FILE '/etc/passwd'
if [[ "${?}" -eq "0" ]]
then
	log "File backup succeeded"
else
	log "File backup failed"
	exit 1
fi
