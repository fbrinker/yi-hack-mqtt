#!/bin/sh

if ! grep -Fq "mqtt/" /home/yi-hack-v3/script/system.sh
then

  echo "
# MQTT Motion Publisher
if [ -f \"/home/yi-hack-v3/mqtt/scripts/publisher.sh\" ]; then
    sh /home/yi-hack-v3/mqtt/scripts/publisher.sh &
fi

# MQTT Motion Subscriber
if [ -f \"/home/yi-hack-v3/mqtt/scripts/subscriber.sh\" ]; then
    sh /home/yi-hack-v3/mqtt/scripts/subscriber.sh &
fi
" >> /home/yi-hack-v3/script/system.sh

fi

# Home Assistant Yi Camera Hack (doesn't hurt anyone I guess)
ln -fs /tmp/ /root/tmp
