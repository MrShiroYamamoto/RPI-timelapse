# RPI-timelapse
### A USB webcam timelapse script

___


I have created this repository as i have found it hard to find a way to capture a timelapse using a USB webcam most are for the Raspberry Pi camera module or use the application motion/

this script has four item you can edit they are:-

1. you can change the line DIR=/pi/pi/timelapse to whereever you want to put the images.
2.  to change the number of images taken just edit ```
while [ $x -le 1440 ]; do```



```
#!/bin/bash
# Timelapse controller for USB webcam
DIR=/pi/pi/timelapse
x=1
while [ $x -le 1440 ]; do
filename=$(date -u +"%d%m%Y_%H%M-%S").jpg
fswebcam -d /dev/video0 -b --no-banner -r 1920x1080 $DIR/$filename
x=$(( $x + 1 ))
sleep 10;
done;
```