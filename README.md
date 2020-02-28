# mk_3rdparty
Makefiles that install a few tools locally. Used for other projects

## Quick start

```
git clone https://github.com/LCBC-UiO/mk_3rdparty
cd mk_3rdparty
make
```

## Use in another project

 * Copy `mk_3rdparty/make_X.mk` for all tools you need into your project.
 * Copy `3rdparty/Makefile` into your project and remove `include make_X.mk` for all tools that are not needed.

## List of tools

 * busybox
 * jq
 * lighttpd
 * postgresql
 * sqlite 
 
## Add a new tool

 * create a new `mk_3rdparty/make_X.mk`
 * add `include make_X.mk` to `3rdparty/Makefile`

## Offline mode (TSD)

Run
```
make prepare_offline
```
all source packages will be downloaded to `3rdparty/download/`.

Copy to offline machine and run `make`.

## 

