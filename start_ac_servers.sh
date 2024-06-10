#!/bin/bash
set -e
HOST=$1
FILES="*.gz"
DEST=/home/rich/ac

# Kill all existing servers
echo "Killing existing Assetto Corsa servers..."
ssh $HOST "killall acServer || true"


# for each directory, cd into it and start the server with ./acServer in a detached screen named after the last directory in the path
echo "Starting Assetto Corsa servers..."
ssh $HOST "cd $DEST; for d in */; do cd \$d; screen -d -m -S \${d%/} ./acServer; cd ..; done"

# List the screens
echo "Screens running on the server:"
ssh $HOST "screen -ls"

echo "Done!"