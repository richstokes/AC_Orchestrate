#!/bin/bash
set -e 

# check if the user has provided a host
if [ -z "$1" ]; then
    echo "Usage: $0 <user@host>"
    exit 1
fi

bash copy_ac_servers.sh $1
bash start_ac_servers.sh $1