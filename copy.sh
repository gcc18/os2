#!bin/bash

TMP=$(mktemp -u)
mount -t ext4 -o loop yocto-image.ext4 $TMP

cp -r labs $TMP/home/labs

unmount $TMP
rmdir $TMP