################################################################################
#
# vis
#
################################################################################

VIS_VERSION = 07ffa2ed847b69ed90859e9fbea40313343f7b7d
VIS_SITE = $(call github,martanne,vis,$(VIS_VERSION))
VIS_DEPENDENCIES = ncurses lua libtermkey
VIS_CONF_OPTS = --enable-curses --enable-lua

define VIS_CONFIGURE_CMDS
	(cd $(@D); ./configure --prefix=$(INSTALL_DIR) $(VIS_CONF_OPTS))
endef

define VIS_BUILD_CMDS
	$(BUILD_OPTS) $(MAKE) -C $(@D)
endef

define VIS_INSTALL_CMDS
	$(MAKE) -C $(@D) install
endef

$(eval $(generic-package))