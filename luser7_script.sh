#!/bin/bash
echo "Parameter 1: ${1}"
echo "Parameter 2: ${2}"
echo "Parameter 3: ${3}"
echo
#Loop through all positional parameters
while [[ "${#}" -gt 0 ]]
do
 	echo "Number of parameters: ${#}"
	echo "Parameter 1: ${1}"
	echo "Parameter 1: ${2}"
	echo "Parameter 1: ${3}"
	echo
	shift
done
