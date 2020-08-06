################################################################################
#
# xlib-libXfont2
#
################################################################################

XLIB_LIBXFONT2_VERSION = 2.0.4
XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.bz2
XLIB_LIBXFONT2_SITE = http://xorg.freedesktop.org/releases/individual/lib
XLIB_LIBXFONT2_LICENSE = MIT
XLIB_LIBXFONT2_LICENSE_FILES = COPYING
XLIB_LIBXFONT2_AUTORECONF = YES
XLIB_LIBXFONT2_DEPENDENCIES = \
	freetype \
	xlib-libfontenc \
	xlib-xtrans \
	xorgproto \
	xfont-encodings

$(eval $(autotools-package))
