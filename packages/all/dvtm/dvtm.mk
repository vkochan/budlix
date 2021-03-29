################################################################################
#
# dvtm
#
################################################################################

DVTM_VERSION = 311a8c0c28296f8f87fb63349e0f3254c7481e14
DVTM_SITE = $(call github,martanne,dvtm,$(DVTM_VERSION))
DVTM_DEPENDENCIES = ncurses

define DVTM_BUILD_CMDS
	$(BUILD_OPTS) $(MAKE) -C $(BUILD_DIR)
endef

define DVTM_INSTALL_CMDS
	$(MAKE) -C $(BUILD_DIR) PREFIX=/usr DESTDIR=$(INSTALL_DIR) install
endef

$(eval $(generic-package))
