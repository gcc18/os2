ARCH ?= x86
TAG ?= 5.15.108

include ./kernel/Makefile
include ./image/Makefile

copy: $(YOCTO_IMAGE)
	image/copy.sh $(YOCTO_IMAGE)
	cp $(YOCTO_IMAGE) yocto_image.ext4

build_kernel: $(ZIMAGE)
	cp $(ZIMAGE) ../bzImage

build_labs: ./labs
	$(MAKE) -C ./labs

	
.PHONY: build_kernel build_labs copy