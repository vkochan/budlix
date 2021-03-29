################################################################################
#
# mcookie
#
################################################################################

MCOOKIE_LICENSE = Public Domain

define MCOOKIE_EXTRACT_CMDS
	cp $(MCOOKIE_PKGDIR)/mcookie.c $(BUILD_DIR)/
endef

define MCOOKIE_BUILD_CMDS
	(cd $(BUILD_DIR); $(BUILD_CC) -Wall -Os -s mcookie.c -o mcookie)
endef

define MCOOKIE_INSTALL_CMDS
	install -m 0755 -D $(BUILD_DIR)/mcookie $(INSTALL_DIR)/usr/bin/mcookie
endef

$(eval $(generic-package))
