################################################################################
#
# tree
#
################################################################################

TREE_VERSION = 1.8.0
TREE_SOURCE = tree-$(TREE_VERSION).tgz
TREE_SITE = ftp://mama.indstate.edu/linux/tree
TREE_LICENSE = GPL-2.0+
TREE_LICENSE_FILES = LICENSE

define TREE_BUILD_CMDS
	$(MAKE) $(BUILD_OPTS) -C $(@D)
endef

define TREE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/tree $(INSTALL_DIR)/usr/bin/tree
endef

$(eval $(generic-package))
