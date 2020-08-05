################################################################################
#
# libpciaccess
#
################################################################################

LIBPCIACCESS_VERSION = 0.16
LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.bz2
LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
LIBPCIACCESS_LICENSE = MIT
LIBPCIACCESS_LICENSE_FILES = COPYING

$(eval $(autotools-package))
