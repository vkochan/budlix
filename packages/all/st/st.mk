################################################################################
#
# st
#
################################################################################

ST_VERSION = fa253f077f19b3220c7655b81bd91e52f4367803
ST_SITE = git://git.suckless.org/st
ST_DEPENDENCIES = xlib-libX11 xlib-libXft fontconfig freetype

ST_OPTS = PREFIX=$(INSTALL_DIR)/usr \
	  X11INC=$(STAGING_DIR)/usr/include/X11 \
	  X11LIB=$(STAGING_DIR)/usr/lib

define ST_BUILD_CMDS
	$(MAKE) $(BUILD_OPTS) $(ST_OPTS) -C $(BUILD_DIR)
endef

define ST_INSTALL_CMDS
	$(MAKE) $(BUILD_OPTS) $(ST_OPTS) -C $(BUILD_DIR) install
endef

$(eval $(generic-package))
