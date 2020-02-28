modules := $(modules) \
	sqlite

LIBVER := autoconf-3310100

.PHONY: sqlite_download
sqlite_download: download/sqlite-${LIBVER}.tar.gz

.PHONY: sqlite_build
sqlite_build: sqlite/bin/sqlite3

.PHONY: sqlite_clean
sqlite_clean:
	$(RM) -r sqlite
	$(RM) -r sqlite_build

.PHONY: sqlite_dlclean
sqlite_dlclean:
	$(RM) download/sqlite-${LIBVER}.tar.gz

download/sqlite-${LIBVER}.tar.gz:
	mkdir -p download/
	cd download && wget https://www.sqlite.org/2020/sqlite-${LIBVER}.tar.gz

sqlite/bin/sqlite3: download/sqlite-${LIBVER}.tar.gz
	mkdir -p sqlite_build \
		&& cd sqlite_build \
		&& tar xf ../download/sqlite-${LIBVER}.tar.gz \
		&& cd sqlite-$(LIBVER) \
		&& ./configure --prefix=$(BASEDIR)/sqlite --without-bzip2
	$(MAKE) -C sqlite_build/sqlite-$(LIBVER)
	$(MAKE) -C sqlite_build/sqlite-$(LIBVER) install
	$(RM) -r sqlite_build
