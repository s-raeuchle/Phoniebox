#!/bin/bash

## https://github.com/hubmeister/install-pi/blob/master/install-pi
DOWNLOAD_DIR=/mnt/e/Downloads
USB_DEVICE=/dev/sdc # see: 'cat /proc/partitions'
USB_MOUNT=/mnt/f/

download_raspios() {
    IMAGE_NAME=`curl -s https://downloads.raspberrypi.org/raspios_lite_arm64_latest \
    | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' \
    | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//'`
    
    FILE_NAME=`echo $IMAGE_NAME | awk -F"/" '{print $7}'`


    FILE_PATH_COMPRESSED=$DOWNLOAD_DIR/$FILE_NAME
    FILE_PATH=${FILE_PATH_COMPRESSED:0:-3}
    IMG_PATH=${FILE_PATH_COMPRESSED:0:-3}
    if [ ! -f "./1.img" ]; then
        curl $IMAGE_NAME --output $FILE_PATH_COMPRESSED
        unxz $FILE_PATH_COMPRESSED
        7z x $FILE_PATH 1.img
        rm $FILE_PATH
    else
        echo $IMAGE_NAME already downloaded: $FILE_PATH -> skip
    fi

    echo ./1.img
}

IMAGE=$(download_raspios)
echo $IMAGE downloaded


# sudo dd if=1.img of=$USB_DEVICE bs=4M conv=fsync status=progress
