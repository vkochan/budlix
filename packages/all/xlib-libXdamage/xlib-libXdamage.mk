################################################################################
#
# xlib-libXdamage
#
################################################################################

XLIB_LIBXDAMAGE_VERSION = 1.1.5
XLIB_LIBXDAMAGE_SOURCE = libXdamage-$(XLIB_LIBXDAMAGE_VERSION).tar.bz2
XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
XLIB_LIBXDAMAGE_LICENSE = MIT
XLIB_LIBXDAMAGE_LICENSE_FILES = COPYING
XLIB_LIBXDAMAGE_DEPENDENCIES = xlib-libX11 xlib-libXfixes xorgproto

$(eval $(autotools-package))
