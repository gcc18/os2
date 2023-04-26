SUBDIRS = $(shell ls | grep ^lab)

for dir in $(SUBDIRS); do \
	$(MAKE) -C $(KDIR) M=$$dir; \
done
