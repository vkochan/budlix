################################################################################
#
# xlib_libfontenc
#
################################################################################

XLIB_LIBFONTENC_VERSION = 1.1.4
XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.bz2
XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
XLIB_LIBFONTENC_LICENSE = MIT
XLIB_LIBFONTENC_LICENSE_FILES = COPYING
XLIB_LIBFONTENC_DEPENDENCIES = zlib xorgproto pkgconf

$(eval $(autotools-package))
