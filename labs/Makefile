SUBDIRS = $(shell ls | grep ^lab)

build:
	for dir in $(SUBDIRS); do \
			$(MAKE) -C $(KDIR) M=dir; \
		done

clean:
	for dir in $(SUBDIRS); do \
			$(MAKE) -C $(KDIR) M=dir clean; \
		done