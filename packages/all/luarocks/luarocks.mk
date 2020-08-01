################################################################################
#
# luarocks
#
################################################################################

LUAROCKS_VERSION = 3.3.1
LUAROCKS_SITE = http://luarocks.org/releases
LUAROCKS_LICENSE = MIT
LUAROCKS_LICENSE_FILES = COPYING
LUAROCKS_DEPENDENCIES = lua

LUAROCKS_CONFIG_DIR = $(STAGING_DIR)/etc
LUAROCKS_CONFIG_FILE_DEFAULT = $(INSTALL_DIR)/etc/luarocks/config-$(LUA_ABIVER).lua
LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/config.lua

LUAROCKS_CONF_OPTS = \
	--prefix=$(INSTALL_DIR)/usr \
	--rocks-tree=$(STAGING_DIR)/usr \
	--sysconfdir=$(INSTALL_DIR)/etc \
	--with-lua=$(STAGING_DIR)/usr

define LUAROCKS_CONFIGURE_CMDS
	cd $(@D) && ./configure $(LUAROCKS_CONF_OPTS)
endef

define LUAROCKS_INSTALL_CMDS
	rm -f $(LUAROCKS_CONFIG_FILE_DEFAULT)
	$(MAKE) -C $(@D) install
	cat $(LUAROCKS_CONFIG_FILE_DEFAULT) $(LUAROCKS_PKGDIR)/luarocks-config.lua \
		> $(INSTALL_DIR)/etc/luarocks/config.lua
	rm -f $(LUAROCKS_CONFIG_FILE_DEFAULT)
endef

$(eval $(generic-package))
