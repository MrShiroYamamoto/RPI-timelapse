# RPI-timelapse
### A USB webcam timelapse script

___

[About this repository](#about)



<a name="about"></a> 

I have created this repository as i have found it hard to find a way to capture a timelapse using a USB webcam most are for the Raspberry Pi camera module or use the application motion/

this script has four item you can edit they are:-

1. you can change the line DIR=/pi/pi/timelapse to whereever you want to put the images.
2.  to change the number of images taken just edit ```
while [ $x -le 1440 ]; do``` to relect the number of images you need to capyure my code example it's 1440
3. the next item you  can change is the  photo resolution in the example below is set for 1920x1080
4. the final part is the line starting sleep the number can be changed to refelect how often you wish to capture new images.

---


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