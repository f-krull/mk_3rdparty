BASEDIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: 3rdparty

.PHONY: 3rdparty
3rdparty:
	$(MAKE) -C 3rdparty lighttpd_build

.PHONY: distclean
distclean:
	$(MAKE) -C 3rdparty clean
