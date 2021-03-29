################################################################################
#
# lshw
#
################################################################################

LSHW_VERSION = 02.19.2
LSHW_SITE = http://ezix.org/software/files
LSHW_SOURCE = lshw-B.$(LSHW_VERSION).tar.gz
LSHW_LICENSE = GPL-2.0
LSHW_LICENSE_FILES = COPYING

LSHW_MAKE_OPTS = CC="$(BUILD_CC)" CXX="$(BUILD_CXX)" AR="$(BUILD_AR)" \
		RPM_OPT_FLAGS="$(BUILD_CFLAGS)" PREFIX=$(INSTALL_DIR)/usr
LSHW_MAKE_ENV = $(BUILD_MAKE_ENV)

define LSHW_BUILD_CMDS
	$(LSHW_MAKE_ENV) $(MAKE) -C $(BUILD_DIR)/src $(LSHW_MAKE_OPTS) all
endef

define LSHW_INSTALL_CMDS
	$(LSHW_MAKE_ENV) $(MAKE) -C $(BUILD_DIR)/src $(LSHW_MAKE_OPTS) install
endef

$(eval $(generic-package))
