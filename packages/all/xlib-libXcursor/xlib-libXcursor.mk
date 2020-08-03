################################################################################
#
# xlib_libXcursor
#
################################################################################

XLIB_LIBXCURSOR_VERSION = 1.2.0
XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.bz2
XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
XLIB_LIBXCURSOR_LICENSE = MIT
XLIB_LIBXCURSOR_LICENSE_FILES = COPYING
XLIB_LIBXCURSOR_DEPENDENCIES = xlib-libX11 xlib-libXfixes xlib-libXrender xorgproto

$(eval $(autotools-package))
