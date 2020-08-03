################################################################################
#
# xlib-libX11
#
################################################################################

XLIB_LIBX11_VERSION = 1.6.9
XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
XLIB_LIBX11_LICENSE = MIT
XLIB_LIBX11_LICENSE_FILES = COPYING
XLIB_LIBX11_DEPENDENCIES = \
	libxcb \
	xutil-macros \
	xlib-xtrans \
	xlib-libXau \
	xlib-libXdmcp \
	xorgproto

XLIB_LIBX11_CONF_OPTS = \
	--disable-malloc0returnsnull \
	--disable-specs \
	--without-perl

$(eval $(autotools-package))
