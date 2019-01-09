#!/bin/sh
source /home/yi-hack-v3/mqtt/mqtt.conf

# We have to delay the startup, otherwise the system is not ready to run a mqtt client yet
 sleep 20

$MOSQUITTO_SUB_BIN -h $MQTT_HOST -u $MQTT_USER -P $MQTT_PASSWORD \
  -I $MQTT_DEVICE_NAME -t "$MQTT_TOPIC_PREFIX/control" \
  | while read RAW_CMD
do
  /home/yi-hack-v3/mqtt/scripts/control.sh $RAW_CMD
done
