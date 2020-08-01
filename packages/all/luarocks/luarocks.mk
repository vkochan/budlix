################################################################################
#
# luarocks
#
################################################################################

LUAROCKS_VERSION = 3.3.1
LUAROCKS_SITE = http://luarocks.org/releases
LUAROCKS_LICENSE = MIT
LUAROCKS_LICENSE_FILES = COPYING

LUAROCKS_CONF_OPTS = \
	--prefix=$(INSTALL_DIR)/usr \
	--sysconfdir=$(INSTALL_DIR)/etc \
	--with-lua=$(STAGING_DIR)/usr

define LUAROCKS_CONFIGURE_CMDS
	cd $(@D) && ./configure $(LUAROCKS_CONF_OPTS)
endef

define LUAROCKS_INSTALL_CMDS
	$(MAKE) -C $(@D) install
endef

$(eval $(generic-package))
