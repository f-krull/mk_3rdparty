modules := $(modules) \
	jq

.PHONY: jq_download
jq_download: download/onig-6.9.4.tar.gz download/jq-1.6.tar.gz

.PHONY: jq_build
jq_build: jq/bin/jq

.PHONY: jq_clean
jq_clean:
	$(RM) -r jq
	$(RM) -r jq_build
	$(RM) -r onig_build

.PHONY: jq_dlclean
jq_dlclean:
	$(RM) download/jq-1.6.tar.gz
	$(RM) download/onig-6.9.4.tar.gz

download/onig-6.9.4.tar.gz:
	mkdir -p download/
	cd download && wget https://github.com/kkos/oniguruma/releases/download/v6.9.4/onig-6.9.4.tar.gz

download/jq-1.6.tar.gz:
	mkdir -p download/
	cd download && wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-1.6.tar.gz
	
jq/bin/jq: download/onig-6.9.4.tar.gz download/jq-1.6.tar.gz
	mkdir -p onig_build \
		&& cd onig_build \
		&& tar xf ../download/onig-6.9.4.tar.gz \
		&& cd onig-6.9.4 \
		&& ./configure --prefix=$(BASEDIR)/onig
	$(MAKE) -C onig_build/onig-6.9.4
	$(MAKE) -C onig_build/onig-6.9.4 install
	$(RM) -r onig_build
	mkdir -p jq_build \
		&& cd jq_build \
		&& tar xf ../download/jq-1.6.tar.gz \
		&& cd jq-1.6 \
		&& ./configure --prefix=$(BASEDIR)/jq --with-oniguruma=$(BASEDIR)/onig/
	$(MAKE) -C jq_build/jq-1.6
	$(MAKE) -C jq_build/jq-1.6 install
	$(RM) -r jq_build
	$(RM) -r onig
