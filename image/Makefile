YOCTO_URL = https://downloads.yoctoproject.org/releases/yocto/yocto-4.1.3/machines/qemu/qemu$(ARCH)
YOCTO_IMAGE = image/core-image-minimal-qemu$(ARCH).ext4

$(YOCTO_IMAGE):
	wget -P image $(YOCTO_URL)/$(YOCTO_IMAGE)
	e2fsck -f image$(YOCTO_IMAGE)
	resize2fs image$(YOCTO_IMAGE) 64M