#!/bin/bash
set -e
HOST=$1
FILES="*.gz"
DEST=/home/rich/ac

# Remove spaces from file names
echo "Removing spaces from file names..."
for f in $FILES; do mv "$f" `echo $f | tr ' ' '_'`; done || true

# Delete old files
echo "Deleting old files on the server..."
ssh $HOST "rm -rf $DEST/*"

# Copy new files
echo "Copying new files to the server..."
scp $FILES $HOST:$DEST

# Extract tar.gz files, into their own directories
echo "Extracting tar.gz files on the server..."
ssh $HOST "cd $DEST; for f in *.gz; do mkdir -p \${f%.gz}; tar -C \${f%.gz} -xzf \$f; done"

# Copy start_ac_servers.sh to the server
echo "Copying start_ac_servers.sh to the server..."
scp start_ac_servers.sh $HOST:$DEST