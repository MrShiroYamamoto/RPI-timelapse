# RPI-timelapse
## A USB webcam timelapse script

---

- [About this repository](#about)
- [requirements](#requirements)
- [how to use this script](#howto)
- [oexample of the timelapse  scripty](#code)



### <a name="about">About this repository</a>

I have created this repository as i have found it hard to find a way to capture a timelapse using a USB webcam most are for the Raspberry Pi camera module or use the application motion. This script will also craete a video file of you captured images to a mp4 format withthe date you crated the video

---

### <a name="requirements">requirements</a>
 This script you will need to install fswebcam to install this on the Raspberry Pi OS just run the following commands
```
sudo apt update && sudo apt install fswebcam ffmpeg -y
```

---

<a name="howto">how use the script</a>

this script has five item you can edit they are:-

1. you can change the line DIR=/home/pi/timelapse to whereever you want to put the images.
2.  to change the number of images taken just edit ```
while [ $x -le 1440 ]; do``` to relect the number of images you need to capyure my code example it's 1440
3. the next item you  can change is the  photo resolution in the example below is set for 1920x1080
4. the final part is the line starting sleep the number can be changed to refelect how often you wish to capture new images.
5. on the last line of code has three part of note first is the frame rate in our case is set to 30 the other two are the locaion of the images (-i) and the resolution (-c:v)


<a name="code"></a>
```
#!/bin/bash
# Timelapse controller for USB webcam
DIR=/home/pi/timelapse
x=1
while [ $x -le 1440 ]; do
filename=$(date -u +"%d%m%Y_%H%M-%S").jpg
fswebcam -d /dev/video0 -b --no-banner -r 1920x1080 $DIR/$filename
x=$(( $x + 1 ))
sleep 10;
done;
ffmpeg -framerate 30 -pattern_type glob -i "/home/pi/timelapse/*.JPG" -s:v 1920x1080 -c:v libx264 -crf 17 -pix_fmt yuv420p "`date +"%d-%m-%Y"`".mp4
```
