# RPI-timelapse
### A USB webcam timelapse script

I have created this repository as i have found it hard to find a way to capture a timelapse using a USB webcam most are for the Raspberry Pi camera module or use the application motion/

this script has three item you can edit 


```
#!/bin/bash
# Timelapse controller for USB webcam
DIR=/mnt/media/timelapse
x=1
while [ $x -le 1440 ]; do
filename=$(date -u +"%d%m%Y_%H%M-%S").jpg
fswebcam -d /dev/video0 -b --no-banner -r 1920x1080 $DIR/$filename
x=$(( $x + 1 ))
sleep 10;
done;
```