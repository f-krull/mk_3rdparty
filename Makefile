BASEDIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: 3rdparty

prepare_offline:
	$(MAKE) -C 3rdparty download

.PHONY: 3rdparty
3rdparty:
	$(MAKE) -C 3rdparty lighttpd_build

.PHONY: distclean
distclean:
	$(MAKE) -C 3rdparty clean
