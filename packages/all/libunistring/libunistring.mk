################################################################################
#
# libunistring
#
################################################################################

LIBUNISTRING_VERSION = 0.9.10
LIBUNISTRING_SITE = $(GNU_MIRROR)/libunistring
LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
LIBUNISTRING_LICENSE = LGPL-3.0+ or GPL-2.0
LIBUNISTRING_LICENSE_FILES = COPYING COPYING.LIB

$(eval $(autotools-package))
