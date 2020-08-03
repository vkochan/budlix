################################################################################
#
# xlib-libXft
#
################################################################################

XLIB_LIBXFT_VERSION = 2.3.3
XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.bz2
XLIB_LIBXFT_SITE = http://xorg.freedesktop.org/releases/individual/lib
XLIB_LIBXFT_LICENSE = MIT
XLIB_LIBXFT_LICENSE_FILES = COPYING
XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib-libX11 xlib-libXext xlib-libXrender xorgproto

$(eval $(autotools-package))
