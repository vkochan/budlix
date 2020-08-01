################################################################################
#
# libtermkey
#
################################################################################

LIBTERMKEY_VERSION = 0.22
LIBTERMKEY_SOURCE = libtermkey-$(LIBTERMKEY_VERSION).tar.gz
LIBTERMKEY_SITE = http://www.leonerd.org.uk/code/libtermkey
LIBTERMKEY_DEPENDENCIES = ncurses libtool pkgconf

define LIBTERMKEY_BUILD_CMDS
	$(BUILD_OPTS) $(MAKE) PREFIX=$(INSTALL_DIR)/usr -C $(@D)
endef

define LIBTERMKEY_INSTALL_CMDS
	$(BUILD_OPTS) $(MAKE) PREFIX=$(INSTALL_DIR)/usr -C $(@D) install
endef

$(eval $(generic-package))
