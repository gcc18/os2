YOCTO_URL = https://downloads.yoctoproject.org/releases/yocto/yocto-4.1.3/machines/qemu/qemu$(ARCH)
YOCTO_IMAGE = core-image-minimal-qemu$(ARCH).ext4


$(YOCTO_IMAGE):
	wget -N $(YOCTO_URL)/$(YOCTO_IMAGE)
	e2fsck -f $(YOCTO_IMAGE)
	resize2fs $(YOCTO_IMAGE) 64M
	cp $(YOCTO_IMAGE) ../yocto-image.ext4
	