################################################################################
#
# tig
#
################################################################################

TIG_VERSION = 2.5.1
TIG_SITE = $(call github,jonas,tig,tig-$(TIG_VERSION))
TIG_DEPENDENCIES = ncurses git

define TIG_RUN_AUTOGEN
	cd $(@D) && PATH=$(PATH) ./autogen.sh
endef
TIG_PRE_CONFIGURE_HOOKS += TIG_RUN_AUTOGEN

define TIG_CONFIGURE_CMDS
	(cd $(@D); $(BUILD_MAKE_ENV) $(BUILD_OPTS) ./configure --prefix=$(INSTALL_DIR)/usr $(TIG_CONF_OPTS))
endef

define TIG_BUILD_CMDS
	$(MAKE) $(BUILD_OPTS) -C $(@D)
endef

define TIG_INSTALL_CMDS
	$(MAKE) $(BUILD_OPTS) -C $(@D) install
endef

$(eval $(generic-package))
