################################################################################
#
# xlib-libXrandr
#
################################################################################

XLIB_LIBXRANDR_VERSION = 1.5.2
XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.bz2
XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
XLIB_LIBXRANDR_LICENSE = MIT
XLIB_LIBXRANDR_LICENSE_FILES = COPYING
XLIB_LIBXRANDR_DEPENDENCIES = xlib-libX11 xlib-libXext xlib-libXrender xorgproto
XLIB_LIBXRANDR_CONF_OPTS = --disable-malloc0returnsnull

$(eval $(autotools-package))
