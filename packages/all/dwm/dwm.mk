################################################################################
#
# dwm
#
################################################################################

DWM_VERSION = bb2e7222baeec7776930354d0e9f210cc2aaad5f
DWM_SITE = git://git.suckless.org/dwm
DWM_DEPENDENCIES = xlib-libX11 xlib-libXft xlib-libXinerama fontconfig freetype

DWM_CFLAGS = -DVERSION='\"$(DWM_VERSION)\"' \
	     -Wno-deprecated-declarations -Os \
	     -I$(STAGING_DIR)/usr/include \
	     -I$(STAGING_DIR)/usr/include/freetype2 \
	     -I$(STAGING_DIR)/usr/include/X11

DWM_OPTS = PREFIX=$(INSTALL_DIR)/usr \
	   CFLAGS="$(DWM_CFLAGS)" \
	   X11LIB=$(STAGING_DIR)/usr/lib

define DWM_BUILD_CMDS
	$(MAKE) $(DWM_OPTS) -C $(@D)
endef

define DWM_INSTALL_CMDS
	$(MAKE) $(DWM_OPTS) -C $(@D) install
endef

$(eval $(generic-package))
