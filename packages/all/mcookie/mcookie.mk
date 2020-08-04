################################################################################
#
# mcookie
#
################################################################################

MCOOKIE_LICENSE = Public Domain

define MCOOKIE_EXTRACT_CMDS
	cp $(MCOOKIE_PKGDIR)/mcookie.c $(@D)/
endef

define MCOOKIE_BUILD_CMDS
	(cd $(@D); $(BUILD_CC) -Wall -Os -s mcookie.c -o mcookie)
endef

define MCOOKIE_INSTALL_CMDS
	install -m 0755 -D $(@D)/mcookie $(INSTALL_DIR)/usr/bin/mcookie
endef

$(eval $(generic-package))
