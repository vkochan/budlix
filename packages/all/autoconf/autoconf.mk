################################################################################
#
# autoconf
#
################################################################################

AUTOCONF_VERSION = 2.69
AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.xz
AUTOCONF_SITE = $(GNU_MIRROR)/autoconf

AUTOCONF_LICENSE = GPL-3.0+ with exceptions
AUTOCONF_LICENSE_FILES = COPYINGv3 COPYING.EXCEPTION

AUTOCONF_CONF_ENV = \
	EMACS="no" \
	ac_cv_path_M4=$(STAGING_DIR)/usr/bin/m4 \
	ac_cv_prog_gnu_m4_gnu=no

AUTOCONF_DEPENDENCIES = libtool perl

$(eval $(autotools-package))

# variables used by other packages
AUTOCONF = $(STAGING_DIR)/usr/bin/autoconf -I "$(ACLOCAL_DIR)"
AUTOHEADER = $(STAGING_DIR)/usr/bin/autoheader -I "$(ACLOCAL_DIR)"
AUTORECONF = $(BUILD_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(STAGING_DIR)/usr/bin/autoreconf -f -i
