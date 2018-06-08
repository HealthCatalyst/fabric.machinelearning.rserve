#!/bin/sh

echo "fabric.machinelearning.rserve version 2018.04.27.01"

echo "calling login.sh from base image"
./login.sh

# Options: --help  this help screen
#  --version  prints Rserve version (also passed to R)
#  --RS-port <port>  listen on the specified TCP port
#  --RS-socket <socket>  use specified local (unix) socket instead of TCP/IP.
#  --RS-workdir <path>  use specified working directory root for connections.
#  --RS-encoding <enc>  set default server string encoding to <enc>.
#  --RS-conf <file>  load additional config file.
#  --RS-settings  dumps current settings of the Rserve
#  --RS-source <file>  source the specified file on startup.
#  --RS-enable-control  enable control commands
#  --RS-enable-remote  enable remote connections

if [[ -z "${DEBUG:-}" ]]; then
  /usr/lib64/R/bin/Rserve --RS-enable-remote --no-save --RS-conf /etc/Rserv.conf
else
  /usr/lib64/R/bin/Rserve.dbg --RS-enable-remote --no-save --RS-conf /etc/Rserv.conf
fi

# while true; do
#   sleep 1
# done