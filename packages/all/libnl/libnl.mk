################################################################################
#
# libnl
#
################################################################################

LIBNL_VERSION = 3.5.0
LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
LIBNL_LICENSE = LGPL-2.1+
LIBNL_LICENSE_FILES = COPYING
LIBNL_INSTALL_STAGING = YES
LIBNL_DEPENDENCIES = bison flex pkgconf

$(eval $(autotools-package))
