
################################################################################
#
# nnn
#
################################################################################

NNN_VERSION = 3.5
NNN_SITE = $(call github,jarun,nnn,v$(NNN_VERSION))
NNN_DEPENDENCIES = readline

define NNN_BUILD_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) $(BUILD_OPTS) -C $(@D)
endef

define NNN_INSTALL_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) $(BUILD_OPTS) -C $(@D) install
endef


$(eval $(generic-package))
