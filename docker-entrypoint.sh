#!/bin/sh

echo "fabric.machinelearning.rserve version 2018.04.27.01"

if [[ -z "${SERVICE_USER:-}" ]]; then
    echo "SERVICE_USER must be specified"
    exit 1
fi
if [[ -z "${SERVICE_PASSWORD:-}" ]]; then
    echo "SERVICE_PASSWORD must be specified"
    exit 1
fi
if [[ -z "${AD_DOMAIN:-}" ]]; then
    echo "AD_DOMAIN must be specified"
    exit 1
fi
if [[ -z "${AD_DOMAIN_SERVER:-}" ]]; then
    echo "AD_DOMAIN_SERVER must be specified"
    exit 1
fi

/opt/install/setupkeytab.sh $SERVICE_USER $AD_DOMAIN $SERVICE_PASSWORD $AD_DOMAIN_SERVER

if [[ -z "${DEBUG:-}" ]]; then
  /usr/lib64/R/bin/Rserve --RS-enable-remote --no-save
else
  /usr/lib64/R/bin/Rserve.dbg --RS-enable-remote --no-save
fi

# while true; do
#   sleep 1
# done