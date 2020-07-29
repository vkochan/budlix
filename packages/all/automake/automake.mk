################################################################################
#
# automake
#
################################################################################

AUTOMAKE_VERSION = 1.15.1
AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
AUTOMAKE_SITE = $(GNU_MIRROR)/automake
AUTOMAKE_LICENSE = GPL-2.0+
AUTOMAKE_LICENSE_FILES = COPYING

AUTOMAKE_DEPENDENCIES = autoconf

define AUTOMAKE_MAKE_ACLOCAL
	mkdir -p $(ACLOCAL_DIR)
endef

AUTOMAKE_POST_INSTALL_HOOKS += AUTOMAKE_MAKE_ACLOCAL

$(eval $(autotools-package))

# variables used by other packages
AUTOMAKE = $(STAGING_DIR)/usr/bin/automake
ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
ACLOCAL = $(STAGING_DIR)/usr/bin/aclocal
ACLOCAL_PATH = $(ACLOCAL_DIR)
export ACLOCAL_PATH
