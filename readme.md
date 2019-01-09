# yi-hack-mqtt

This projects adds a MQTT subscriber and publisher for motion detection to the [yi-hack-v3](https://github.com/shadow-1/yi-hack-v3) project.

## Requirements

You need a camera with the [yi-hack-v3](https://github.com/shadow-1/yi-hack-v3) firmware.

You have to **enable Motion Detection / Alarms for the camera via the Yi App**:
Stopping the motion detection just kills some processes on the camera and won't change the settings in the App. Starting the motion detection again will just "revive" the killed processes.

## Setup

* Login to your camera via telnet/ssh. The username should be `root` and the password isn't set by default.
* Move into the home directory: `cd /home/yi-hack-v3`
* Download & untar the project: `wget yi-hack-mqtt-1.tar && tar -xvf yi-hack-mqtt-1.tar && rm yi-hack-mqtt-1.tar && cd mqtt`
* Edit the mqtt.conf and add your MQTT broker ip and login credentials: `vi mqtt.conf`
* *Remember: To save & close vi, press ESC and enter `:wq` and press Return/Enter*
* Run the install script `./install.sh`
* Reboot the camera `reboot`This projects adds a MQTT subscriber and publisher for motion detection to the yi-hack-v3 project.

## Usage

* The camera will publish MQTT messages to the topic `/home/camera/*hostname*/motion/state` (default) with the value `1` if motion is detected and `0` if the recording stopped again.
* You can publish `start` to the topic `/home/camera/*hostname*/motion/control` (default) to start the motion detection and `stop` to stop it.

So you can react to state changes (Alarms) via software like Home Assistant and it's MQTT sensors. This will also allow you to activate the motion detection if you leave the house and to deactivate it if you are back home.

## Thanks

Special thanks to [dvv](https://github.com/dvv) for the [compiled mosquitto binaries](https://github.com/shadow-1/yi-hack-v3/issues/130).