LOCAL_NAME ?= gucd
ARCH ?= x86
TAG ?= 5.15.108
CONFIG ?= confs/kernel_config.x86

KURL = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/linux-$(TAG).tar.gz
KDIR = $(shell realpath $(PWD)/linux-$(TAG))
KCONFIG = $(KDIR)/.config

ZIMAGE = $(KDIR)/arch/$(ARCH)/boot/bzImage


bzImage: $(ZIMAGE)
	cp $(ZIMAGE) bzImage


$(KDIR):
	wget $(KURL)
	tar -xvzf linux-$(TAG).tar.gz

$(KCONFIG): $(CONFIG) $(KDIR)
	cp $(CONFIG) $(KDIR)/.config
	$(MAKE) -C $(KDIR) olddefconfig
	$(MAKE) -C $(KDIR) mod2yesconfig

$(ZIMAGE): $(KCONFIG)
	$(MAKE) -C $(KDIR) -j2
	$(MAKE) -C $(KDIR) -j2 modules
	
