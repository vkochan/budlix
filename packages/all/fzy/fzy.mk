################################################################################
#
# fzy
#
################################################################################

FZY_VERSION = 395a2534aca4a704da7501c5e79268420e41d174
FZY_SITE = $(call github,jhawthorn,fzy,$(FZY_VERSION))

FZY_BUILD_OPTS = \
	CC="$(BUILD_CC)" \
	LDFLAGS="$(BUILD_LDFLAGS)" \
	CCFLAGS="$(BUILD_CFLAGS)" \
	PREFIX=$(INSTALL_DIR)/usr

define FZY_BUILD_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) $(FZY_BUILD_OPTS) -C $(@D)
endef

define FZY_INSTALL_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) $(FZY_BUILD_OPTS) -C $(@D) install
endef

$(eval $(generic-package))
