#!/bin/sh
source /home/yi-hack-v3/mqtt/mqtt.conf

# publish motion triggers via MQTT
# $1 topic (state|photo|video)
# $2 data
 publish() {
    echo "publishing... "
    case "$1" in
	state)
    	    MESSAGE="-m $2"
	    ;;
	*)
	    MESSAGE="-f $2"
    esac

    $MOSQUITTO_PUB_BIN -h $MQTT_HOST -u $MQTT_USER -P $MQTT_PASSWORD \
	-t "$MQTT_TOPIC_PREFIX/$1" $MESSAGE
    echo "done"
 }

# Application loop
 triggered=0
 while true; do
    publish_state=0
    publish_photo=0
    publish_video=0

    test -r /tmp/sd/record/tmp.mp4.tmp
    is_recording=$((1-$?))

    if [ "$is_recording" != "$triggered" ]; then
        triggered="$is_recording"
	publish_state=1
    fi

    #if [ -r /tmp/motion.jpg -a ! -r /tmp/temp.jpg ]; then
	#    cp /tmp/motion.jpg /tmp/temp.jpg
	#    echo "found photo"
	#    publish_photo=1
    #fi

    #if [ -r /tmp/motion.mp4 -a ! -r /tmp/temp.mp4 ]; then
	#    cp /tmp/motion.mp4 /tmp/temp.mp4
	#    echo "found video"
	#    publish_video=1
    #fi

    if [ "$triggered" = 0 ]; then
       rm /tmp/temp.jpg /tmp/temp.mp4 2> /dev/null
    fi

    if [ "$publish_state" = 1 ]; then
	    publish state $triggered
    fi

    #if [ "$publish_photo" = 1 ]; then
    #    publish photo /tmp/temp.jpg
    #fi

    #if [ "$publish_video" = 1 ]; then
    #    publish video /temp/temp.mp4
    #fi

    sleep 0.01
 done
