################################################################################
#
# xlib-libXt
#
################################################################################

XLIB_LIBXT_VERSION = 1.2.0
XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
XLIB_LIBXT_LICENSE = MIT
XLIB_LIBXT_LICENSE_FILES = COPYING
XLIB_LIBXT_DEPENDENCIES = xlib-libSM xlib-libX11 xorgproto xcb-proto libxcb
XLIB_LIBXT_CONF_OPTS = --disable-malloc0returnsnull

$(eval $(autotools-package))
