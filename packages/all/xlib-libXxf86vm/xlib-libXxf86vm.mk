################################################################################
#
# xlib-libXxf86vm
#
################################################################################

XLIB_LIBXXF86VM_VERSION = 1.1.4
XLIB_LIBXXF86VM_SOURCE = libXxf86vm-$(XLIB_LIBXXF86VM_VERSION).tar.bz2
XLIB_LIBXXF86VM_SITE = http://xorg.freedesktop.org/releases/individual/lib
XLIB_LIBXXF86VM_LICENSE = MIT
XLIB_LIBXXF86VM_LICENSE_FILES = COPYING
XLIB_LIBXXF86VM_DEPENDENCIES = xlib-libX11 xlib-libXext xorgproto
XLIB_LIBXXF86VM_CONF_OPTS = --disable-malloc0returnsnull

$(eval $(autotools-package))
