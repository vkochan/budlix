################################################################################
#
# xdrv-xf86-input-libinput
#
################################################################################

XDRV_XF86_INPUT_LIBINPUT_VERSION = 0.30.0
XDRV_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRV_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
XDRV_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
XDRV_XF86_INPUT_LIBINPUT_LICENSE = MIT
XDRV_XF86_INPUT_LIBINPUT_LICENSE_FILES = COPYING
XDRV_XF86_INPUT_LIBINPUT_DEPENDENCIES = libinput xorg-server xorgproto
XDRV_XF86_INPUT_LIBINPUT_AUTORECONF = YES

$(eval $(autotools-package))
