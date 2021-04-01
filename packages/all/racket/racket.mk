################################################################################
#
# racket
#
################################################################################

RACKET_VERSION = 8.0
RACKET_SITE = $(call github,racket,racket,v$(RACKET_VERSION))
RACKET_DEPENDENCIES = libffi
RACKET_SUBDIR = racket/src
RACKET_CONF_OPTS = --prefix=/usr \
		   --sysconfdir=/etc \
		   --enable-csonly

RACKET_BOOT_SOURCE = v$(RACKET_VERSION).tar.gz
RACKET_EXTRA_DOWNLOADS = https://github.com/racket/pb/archive/refs/heads/$(RACKET_BOOT_SOURCE)

RACKET_ENV_FILE = $(INSTALL_DIR)/etc/budlix/env/racket

define RACKET_EXTRACT_BOOT_SOURCE
	mkdir -p $(BUILD_DIR)/$(RACKET_SUBDIR)/ChezScheme/boot/pb
	$(call suitable-extractor,$(RACKET_BOOT_SOURCE)) $(RACKET_DL_DIR)/$(RACKET_BOOT_SOURCE) | \
		$(TAR) --strip-components=1 -C $(BUILD_DIR)/$(RACKET_SUBDIR)/ChezScheme/boot/pb $(TAR_OPTIONS) -
endef
RACKET_POST_EXTRACT_HOOKS += RACKET_EXTRACT_BOOT_SOURCE

define RACKET_CONFIGURE_CMDS
	(cd $(BUILD_DIR)/$(RACKET_SUBDIR); $(BUILD_MAKE_ENV) ./configure $(RACKET_CONF_OPTS))
endef

define RACKET_BUILD_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) -C $(BUILD_DIR)/$(RACKET_SUBDIR)
endef

define RACKET_INSTALL_CMDS
	mkdir -p $(INSTALL_DIR)/etc/budlix/env
	rm -f $(RACKET_ENV_FILE)
	echo "export PLTCONFIGDIR=$(INSTALL_DIR)/etc/racket" >> $(RACKET_ENV_FILE)
	echo "export PLTCOLLECTS=$(INSTALL_DIR)/usr/share/racket/collects" >> $(RACKET_ENV_FILE)

	$(BUILD_MAKE_ENV) $(MAKE) DESTDIR="$(INSTALL_DIR)" -C $(BUILD_DIR)/$(RACKET_SUBDIR) install

	cp $(RACKET_PKGDIR)/config.rktd $(INSTALL_DIR)/etc/racket
	$(SED) $(INSTALL_DIR)/etc/racket/config.rktd -e 's|@SYSROOT@|$(SYSROOT_DIR)|g'
endef

$(eval $(generic-package))
