export ARCH ?= x86
export TAG ?= 5.15.108
export LOCAL_NAME ?= -gucd

export KDIR = $(shell realpath $(PWD)/kernel/linux-$(TAG))
export KIMAGE = ../bzImage

build: 
	$(MAKE) -C kernel
	$(MAKE) -C image

labs: labs
	$(MAKE) -C labs
	
.PHONY: build labs