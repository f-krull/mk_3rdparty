modules := $(modules) \
	busybox

LIBVER := 1.31.1

.PHONY: busybox_download
busybox_download: download/busybox-${LIBVER}.tar.bz2

.PHONY: busybox_build
busybox_build: busybox/bin/busybox

.PHONY: busybox_clean
busybox_clean:
	$(RM) -r busybox
	$(RM) -r busybox_build

.PHONY: busybox_dlclean
busybox_dlclean:
	$(RM) download/busybox-${LIBVER}.tar.bz2

download/busybox-${LIBVER}.tar.bz2:
	mkdir -p download/
	cd download && wget https://www.busybox.net/downloads/busybox-${LIBVER}.tar.bz2

busybox/bin/busybox: download/busybox-${LIBVER}.tar.bz2
	mkdir -p busybox_build \
		&& cd busybox_build \
		&& tar xf ../download/busybox-${LIBVER}.tar.bz2
	$(MAKE) -C busybox_build/busybox-$(LIBVER) defconfig
	$(MAKE) -C busybox_build/busybox-$(LIBVER) install CONFIG_PREFIX=$(BASEDIR)/busybox LDFLAGS="--static"
	$(RM) -r busybox_build
