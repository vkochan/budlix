################################################################################
#
# dash
#
################################################################################

DASH_VERSION = 0.5.11
DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
DASH_LICENSE_FILES = COPYING

DASH_CONF_OPTS += --without-libedit

define DASH_INSTALL_CMDS
	$(INSTALL) -m 0755 -D $(@D)/src/dash $(INSTALL_DIR)/usr/bin/dash
endef

$(eval $(autotools-package))
