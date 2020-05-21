# mk_3rdparty
Makefiles that install a few tools locally. Used for other projects

## Quick start

```
git clone https://github.com/LCBC-UiO/mk_3rdparty
cd mk_3rdparty
make
```

## Use in another project

 1. Copy `mk_3rdparty/make_X.mk` for all tools you need into your project.
 2. Copy [`3rdparty/Makefile`](./3rdparty/Makefile) into your project and remove `include make_X.mk` for all tools that are not needed.

## List of tools

 * busybox
 * jq
 * lighttpd
 * postgresql
 * php
 * sqlite 
 
## Add a new tool

 1. create a new `mk_3rdparty/make_X.mk`
 2. add `include make_X.mk` to[`3rdparty/Makefile`](./3rdparty/Makefile)

## Offline mode (TSD)

 1. Run `make prepare_offline`. All source packages will be downloaded to `3rdparty/download/`.
 2. Copy everything to the offline machine and run `make`.



