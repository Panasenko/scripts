#!/bin/bash

echo "[info] Creating an archive"

if [ -d $1 ]; then
  echo "File path to folder: $1"
  NEW_PATH="$1.tar.bz2"
  tar --totals -cjvf $NEW_PATH $1
  echo "[done] Archive created successfully"
  echo "[done] $NEW_PATH"
fi

echo "[info] Start sending $NEW_PATH to remote server"

if [ -f $NEW_PATH ]; then
  rsync -azvh --progress $NEW_PATH server@192.168.50.123:/media/storage/Backups/ 
  echo "[done] File sending successfully"
fi
