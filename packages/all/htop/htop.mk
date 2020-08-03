################################################################################
#
# htop
#
################################################################################

HTOP_VERSION = 2.2.0
HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
HTOP_DEPENDENCIES = ncurses
# Prevent htop build system from searching the host paths
HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
HTOP_LICENSE = GPL-2.0
HTOP_LICENSE_FILES = COPYING
HTOP_CONF_OPTS += --enable-unicode

$(eval $(autotools-package))
