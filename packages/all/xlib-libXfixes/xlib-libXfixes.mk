################################################################################
#
# xlib-libXfixes
#
################################################################################

XLIB_LIBXFIXES_VERSION = 5.0.3
XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.bz2
XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
XLIB_LIBXFIXES_LICENSE = MIT
XLIB_LIBXFIXES_LICENSE_FILES = COPYING
XLIB_LIBXFIXES_DEPENDENCIES =  xlib-libX11 xorgproto

$(eval $(autotools-package))
