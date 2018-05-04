#!/bin/sh

echo "fabric.machinelearning.rserve version 2018.04.27.01"

echo "calling login.sh from base image"
./login.sh

if [[ -z "${DEBUG:-}" ]]; then
  /usr/lib64/R/bin/Rserve --RS-enable-remote --no-save
else
  /usr/lib64/R/bin/Rserve.dbg --RS-enable-remote --no-save
fi

# while true; do
#   sleep 1
# done