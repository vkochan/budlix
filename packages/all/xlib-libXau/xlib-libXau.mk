################################################################################
#
# xlib_libXau
#
################################################################################

XLIB_LIBXAU_VERSION = 1.0.9
XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.bz2
XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
XLIB_LIBXAU_LICENSE = MIT
XLIB_LIBXAU_LICENSE_FILES = COPYING
XLIB_LIBXAU_DEPENDENCIES = pkgconf xutil-macros xorgproto

$(eval $(autotools-package))
