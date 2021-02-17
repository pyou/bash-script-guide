#!/usr/bin/env bash

# Cleanup, version 3

LOG_DIR=/var/log
ROOT_UID=0
E_NOTROOT=87
E_WRONGARGS=85
E_XCD=86

if [ "$UID" -ne "$ROOT_UID" ]; then
    echo "Must be root to run this script."
    exit $E_NOTROOT
fi

case "$1" in
"" ) lines=50
  ;;
*[!0-9]* ) echo "Usage: `basename $0` lines-to-cleanup";
  exit $E_WRONGARGS
  ;;
* ) lines=$1
  ;;
esac

#cd $LOG_DIR
#if [ `pwd` != "$LOG_DIR" ]; then
#    echo "Can't change to $LOG_DIR."
#    exit $E_XCD
#fi

cd $LOG_DIR || {
  echo "Can't change to $LOG_DIR."
  exit $E_XCD
}

tail -n $lines syslog > syslog.temp
mv syslog.temp syslog
cat /dev/null > wtmp.1

echo "Logs files cleaned up."
exit 0