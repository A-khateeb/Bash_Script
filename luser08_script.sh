#!/bin/bash
#This script demonsrates the I/O redirection

#Redirect STDOUT To A File
FILE="/tmp/data"
head -n5 "/etc/passwd" > ${FILE}
#Redirect STDIN To A File
read LINE < ${FILE}
echo "LINE Contains:${LINE}"
#Redirect STDOUT to a file and Overwrite the file
head -n3 /etc/passwd > ${FILE}
echo " "
echo "Content of ${FILE}"
cat ${FILE}
#Redirect STDOUT and append a file
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo " "
echo "Content of ${FILE}"
cat ${FILE}
#Redirect STDOUT to a program, using FD 0
read LINE 0< ${FILE}
echo " "
echo "LINE Contains: ${LINE}"
#Redirect STDOUT to a file using FD1, overwriting the file
head -n3 /etc/passwd 1> $FILE}
echo " "
echo "Content of the ${FILE}"
cat ${FILE}
#Redirect STDERR to a file using FD 2
ERR_FILE="/tmp/file.err"
head -n3 /etc/passwd /fakfile 2> ${ERR_FILE}
echo " "
echo "Content of ${FILE}"
cat ${FILE}
#Redirect STDOUT and STDERR to a file
head -n3 /etc/passwd /faskfile &> ${FILE}
echo " "
echo "contents of ${FILE}"
cat ${FILE}
#Redirect STDOUT and STDERR through a pipe
echo " "
head -n3 /etc/passwd /fakefile |& cat -n
#Send output to STDERR
echo "This is STDERR!" >&2
#Discard STDOUT
echo
echo "Discarding STDOUT:"
head -n3 /etc/passwd /fakefile > /dev/null
#Discard STDERR
echo
echo "Discarding STDERR:"
head -n3 /etc/passwd /fakefile 2> /dev/null
#Discard STDOUT and STDERR
echo
echo "Discarding STDOUT & STDERR:"
head -n3 /etc/passwd /fakefile &> /dev/null
rm -rf ${FILE} ${ERR_FILE}
