################################################################################
#
# iw
#
################################################################################

IW_VERSION = 5.4
IW_SOURCE = iw-$(IW_VERSION).tar.xz
IW_SITE = $(KERNEL_MIRROR)/software/network/iw
IW_LICENSE = ISC
IW_LICENSE_FILES = COPYING
IW_DEPENDENCIES = pkgconf libnl
IW_MAKE_ENV = \
	$(BUILD_MAKE_ENV) \
	PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config"

define IW_BUILD_CMDS
	$(IW_MAKE_ENV) $(BUILD_OPTS) $(MAKE) -C $(@D)
endef

define IW_INSTALL_CMDS
	$(IW_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(INSTALL_DIR) install
endef

$(eval $(generic-package))
