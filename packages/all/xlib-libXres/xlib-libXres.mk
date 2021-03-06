################################################################################
#
# xlib-libXres
#
################################################################################

XLIB_LIBXRES_VERSION = 1.2.0
XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.bz2
XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
XLIB_LIBXRES_LICENSE = MIT
XLIB_LIBXRES_LICENSE_FILES = COPYING
XLIB_LIBXRES_DEPENDENCIES = xlib-libX11 xlib-libXext xorgproto
XLIB_LIBXRES_CONF_OPTS = --disable-malloc0returnsnull

$(eval $(autotools-package))
