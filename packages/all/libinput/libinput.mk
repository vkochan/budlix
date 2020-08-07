################################################################################
#
# libinput
#
################################################################################

LIBINPUT_VERSION = 1.15.6
LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
LIBINPUT_DEPENDENCIES = pkgconf libevdev mtdev udev
LIBINPUT_LICENSE = MIT
LIBINPUT_LICENSE_FILES = COPYING
LIBINPUT_CONF_OPTS = -Dtests=false -Dlibwacom=false -Ddocumentation=false -Ddebug-gui=false

$(eval $(meson-package))
