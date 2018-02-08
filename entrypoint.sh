#!/bin/bash

set -e

Usage () {
  echo "Usage: $0 [dump|restore] [restore_file]"
}

# main
if [ "$#" -ne 1 ]; then
    echo "need at least one parameter"
    Usage
    exit
fi

cmd=$1
PGUSER=${PGUSER:-dbadmin}

case $cmd in
  dump )
    exec /dump.sh
    ;;
  restore )
    exec /restore.sh
    ;;
  * )
    echo "wrong command, exist ..."
    Usage
    exit
esac
