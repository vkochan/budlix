################################################################################
#
# xorg-server
#
################################################################################

XORG_SERVER_VERSION = 1.20.8
XORG_SERVER_SOURCE = xorg-server-$(XORG_SERVER_VERSION).tar.bz2
XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
XORG_SERVER_LICENSE = MIT
XORG_SERVER_LICENSE_FILES = COPYING
XORG_SERVER_AUTORECONF = YES

XORG_SERVER_ENABLE_PACKAGES = \
			      xapp-xinit \
			      xdrv-xf86-input-libinput \
			      xdrv-xf86-input-keyboard \
			      xdrv-xf86-input-mouse \
			      xdrv-xf86-video-intel

XORG_SERVER_DEPENDENCIES = \
	xfont-util \
	xutil-macros \
	xlib-libXfont2 \
	xlib-libX11 \
	xlib-libXau \
	xlib-libXdmcp \
	xlib-libXext \
	xlib-libXfixes \
	xlib-libXi \
	xlib-libXrender \
	xlib-libXres \
	xlib-libXft \
	xlib-libXcursor \
	xlib-libXinerama \
	xlib-libXrandr \
	xlib-libXdamage \
	xlib-libXxf86vm \
	xlib-libxkbfile \
	xlib-xtrans \
	xdata-xbitmaps \
	xorgproto \
	xkeyboard-config \
	pixman \
	mcookie \
	pkgconf \
	libdrm \
	libepoxy \
	libgl

# We force -O2 regardless of the optimization level chosen by the
# user, as the X.org server is known to trigger some compiler bugs at
# -Os on several architectures.
XORG_SERVER_CONF_OPTS = \
	--disable-unit-tests \
	--enable-suid-wrapper \
	--with-fontrootdir=$(STAGING_DIR)/usr/share/fonts/X11/ \
	--with-xkb-path=$(STAGING_DIR)/usr/share/X11/xkb \
	--with-xkb-output=$(INSTALL_DIR)/usr/share/X11/xkb/compiled \
	--with-module-dir=$(STAGING_DIR)/usr/lib/xorg/modules \
	CFLAGS="$(BUILD_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1 -O2"

$(eval $(autotools-package))
