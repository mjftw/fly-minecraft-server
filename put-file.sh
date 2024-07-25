#!/bin/bash

FILE=$1
REMOTE_DIR=$2
if [ -z "$FILE" ] || [ -z "$REMOTE_DIR" ]; then
  echo "Usage: $0 <local-file> <remote-dir>"
  echo "  Uploads a file to a remote directory on the fly machine via SFTP"
  echo "  <file> - file to upload"
  echo "  <remote-dir> - remote directory to upload to"
  exit 1
fi

fly machine start
flyctl ssh sftp shell << EOF
cd "$REMOTE_DIR"
put "$FILE"
EOF