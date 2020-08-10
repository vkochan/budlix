################################################################################
#
# xdrv-xf86-input-keyboard
#
################################################################################

XDRV_XF86_INPUT_KEYBOARD_VERSION = 1.9.0
XDRV_XF86_INPUT_KEYBOARD_SOURCE = xf86-input-keyboard-$(XDRV_XF86_INPUT_KEYBOARD_VERSION).tar.bz2
XDRV_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individual/driver
XDRV_XF86_INPUT_KEYBOARD_LICENSE = MIT
XDRV_XF86_INPUT_KEYBOARD_LICENSE_FILES = COPYING
XDRV_XF86_INPUT_KEYBOARD_DEPENDENCIES = xorg-server xorgproto
XDRV_XF86_INPUT_KEYBOARD_CONF_OPTS = --disable-selective-werror

$(eval $(autotools-package))
