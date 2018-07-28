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
readonly VERBOSE="true"
log "Hi"
log "This is fun"
