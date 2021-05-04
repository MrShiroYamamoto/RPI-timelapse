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
ffmpeg -framerate 30 -pattern_type glob -i "/home/pi/timelapse/*.JPG" -s:v 1920x1080 -c:v libx264 -crf 17 -pix_fmt yuv420p "`date +"%d-%m-%Y"`".mp4
