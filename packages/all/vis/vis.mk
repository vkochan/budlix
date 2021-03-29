################################################################################
#
# vis
#
################################################################################

VIS_VERSION = 07ffa2ed847b69ed90859e9fbea40313343f7b7d
VIS_SITE = $(call github,martanne,vis,$(VIS_VERSION))
VIS_DEPENDENCIES = ncurses lua lpeg libtermkey
VIS_CONF_OPTS = --enable-curses --enable-lua

ifeq ($(PACKAGE_ACL),y)
VIS_CONF_OPTS += --enable-acl
else
VIS_CONF_OPTS += --disable-acl
endif

define VIS_CONFIGURE_CMDS
	(cd $(BUILD_DIR); $(BUILD_MAKE_ENV) $(BUILD_OPTS) ./configure --prefix=$(INSTALL_DIR)/usr $(VIS_CONF_OPTS))
endef

define VIS_BUILD_CMDS
	$(MAKE) $(BUILD_OPTS) -C $(BUILD_DIR)
endef

define VIS_INSTALL_CMDS
	$(MAKE) $(BUILD_OPTS) -C $(BUILD_DIR) install
endef

$(eval $(generic-package))
