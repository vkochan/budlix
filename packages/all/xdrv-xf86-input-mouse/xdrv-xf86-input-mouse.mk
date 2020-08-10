################################################################################
#
# xdrv-xf86-input-mouse
#
################################################################################

XDRV_XF86_INPUT_MOUSE_VERSION = 1.9.3
XDRV_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRV_XF86_INPUT_MOUSE_VERSION).tar.bz2
XDRV_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
XDRV_XF86_INPUT_MOUSE_LICENSE = MIT
XDRV_XF86_INPUT_MOUSE_LICENSE_FILES = COPYING
XDRV_XF86_INPUT_MOUSE_DEPENDENCIES = xorg-server xorgproto
XDRV_XF86_INPUT_MOUSE_AUTORECONF = YES

$(eval $(autotools-package))
