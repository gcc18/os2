#!bin/bash


TMP=$(mktemp -u)
sudo mount -t ext4 -o loop $1 $TMP

cp -r labs $TMP/home/labs

sudo unmount $TMP
rmdir $TMP