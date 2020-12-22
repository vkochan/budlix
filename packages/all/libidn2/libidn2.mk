################################################################################
#
# libidn2
#
################################################################################

LIBIDN2_VERSION = 2.3.0
LIBIDN2_SITE = $(GNU_MIRROR)/libidn
LIBIDN2_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode

$(eval $(autotools-package))
