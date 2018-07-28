#!/bin/bash
#redirect STDOUT to a file

FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}
