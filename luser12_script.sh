#!/bin/bash
# case "${1}" in
# 	start)
# 	echo "Starting..."
# 	;;
# 	stop)
# 	echo "Stopping"
# 	;;
# 	status|state|--status|--state)
# 	echo "Status"
# 	;;
# 	*)
# 	echo "Supply a valid status"
# 	exit 1
# 	;;
# esac
# /etc/init.d/sshd status
case "${1}" in
	start)
	echo "Starting..."
	;;
	stop)
	echo "Stopping"
	;;
	status|state|--status|--state)
	echo "Status"
	;;
	*)
	echo "Supply a valid status"
	exit 1
	;;
esac
/etc/init.d/sshd status
#This script demonsrates the case statment
#if [[ "${1}" = "start" ]]
#then
#	echo "Starting"
#elif [[ "${1}" = "stop" ]]; then
	#statements
#	echo "Stopping"
#elif [[ "${1}" = "status" ]];
#then
	#statements
#	echo "Status:"
#else
#	echo "Supply a valid status" >&2
#	exit 1
#fi
