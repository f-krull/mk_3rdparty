BASEDIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: _all
_add: all

modules := 

include make_busybox.mk
include make_gnuparallel.mk
include make_jq.mk
include make_lighttpd.mk
include make_postgresql.mk
include make_php.mk
include make_sqlite.mk

all: $(addsuffix _build, $(modules))

.PHONY: download
download: $(addsuffix _download, $(modules))

.PHONY: clean
clean: $(addsuffix _clean, $(modules))

.PHONY: dlclean
dlclean: $(addsuffix _dlclean, $(modules))
