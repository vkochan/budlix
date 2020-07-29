################################################################################
#
# pixman
#
################################################################################

PIXMAN_VERSION = 0.40.0
PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.xz
PIXMAN_SITE = https://xorg.freedesktop.org/releases/individual/lib
PIXMAN_LICENSE = MIT
PIXMAN_LICENSE_FILES = COPYING
PIXMAN_DEPENDENCIES = pkgconf

# For 0001-Disable-tests.patch
PIXMAN_AUTORECONF = YES

# don't build gtk based demos
PIXMAN_CONF_OPTS = --disable-gtk

$(eval $(autotools-package))
