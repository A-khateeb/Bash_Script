#!/bin/bash
#netstat -nutl "${1}" | grep ':' | awk "{print $4}" | cut -d ":" -f 2
netstat -nutl "${1}" | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}'
