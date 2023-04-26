LOCAL_NAME ?= -gucd
CONFIG ?= ./kernel/kernel_config.x86

KURL = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/linux-$(TAG).tar.gz
KDIR = $(shell realpath $(PWD)/kernel/linux-$(TAG))
KCONFIG = $(KDIR)/.config

ZIMAGE = $(KDIR)/arch/$(ARCH)/boot/bzImage

$(KDIR):
	wget -P ./kernel $(KURL) 
	tar -xvzf -C ./kernel ./kernel/linux-$(TAG).tar.gz

$(KCONFIG):  $(KDIR)
	cp $(CONFIG) $(KDIR)/.config
	echo "\nCONFIG_LOCALVERSION=\"-gucd-qemu\"" >> $(KDIR)/.config
	$(MAKE) -C $(KDIR) olddefconfig
	$(MAKE) -C $(KDIR) mod2yesconfig

$(ZIMAGE): $(KCONFIG)
	$(MAKE) -C $(KDIR) -j$(shell nproc)
	$(MAKE) -C $(KDIR) -j$(shell nproc) modules


	


