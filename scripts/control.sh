#!/bin/sh
source /home/yi-hack-v3/mqtt/mqtt.conf

case $1 in
  start)
    echo "Starting motion detection..."
    /home/app/watch_process &
    ;;
  stop)
    echo "Stopping motion detection..."
    killall watch_process
    killall mp4record
    rm /tmp/sd/record/tmp.mp4.tmp 2> /dev/null
    ;;
  *)
    echo "Usage: control.h cmd - cmd can be start or stop"
    ;;
esac
