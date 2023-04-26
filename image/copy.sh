YOCTO_IMAGE=$1

e2fsck -f YOCTO_IMAGE
resize2fs YOCTO_IMAGE 64M

TMP=$(mktemp -d)

mount -t ext4 -o loop $YOCTO_IMAGE $TMP

cp ../labs $TMP/home/labs

unmount $TMP
rmdir $TMP