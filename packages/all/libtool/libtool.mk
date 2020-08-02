################################################################################
#
# libtool
#
################################################################################

LIBTOOL_VERSION = 2.4.6
LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
LIBTOOL_SITE = $(GNU_MIRROR)/libtool
LIBTOOL_USE_FOR_BUILD = YES

# LIBTOOL_SUBDIR = libltdl
LIBTOOL_SUBDIR = .

LIBTOOL_CONF_OPTS = --enable-ltdl-install

LIBTOOL_DEPENDENCIES = m4 help2man

LIBTOOL_LICENSE = LGPL-2.1+
LIBTOOL_LICENSE_FILES = $(LIBTOOL_SUBDIR)/COPYING.LIB

$(eval $(autotools-package))

# variables used by other packages
LIBTOOL = $(STAGING_DIR)/usr/bin/libtool
LIBTOOLIZE = $(STAGING_DIR)/usr/bin/libtoolize
