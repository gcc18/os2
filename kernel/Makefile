CONFIG ?= kernel_config.x86

KURL = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/linux-$(TAG).tar.gz

KCONFIG = $(KDIR)/.config

ZIMAGE = $(KDIR)/arch/$(ARCH)/boot/bzImage



$(KDIR):
	wget -N  $(KURL) 
	tar -xvzf linux-$(TAG).tar.gz 

$(KCONFIG):  $(KDIR)
	cp $(CONFIG) $(KDIR)/.config
	echo "\nCONFIG_LOCALVERSION=\"$(LOCAL_NAME)\"" >> $(KDIR)/.config
	$(MAKE) -C $(KDIR) olddefconfig
	$(MAKE) -C $(KDIR) mod2yesconfig

$(ZIMAGE): $(KCONFIG)
	$(MAKE) -C $(KDIR) -j$(shell nproc)
	$(MAKE) -C $(KDIR) -j$(shell nproc) modules

$(KIMAGE): $(ZIMAGE)
	cp $(ZIMAGE) $(KIMAGE)


	


