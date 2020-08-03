################################################################################
#
# traceroute
#
################################################################################

TRACEROUTE_VERSION = 2.1.0
TRACEROUTE_SITE = http://downloads.sourceforge.net/traceroute/traceroute/traceroute-$(TRACEROUTE_VERSION)

TRACEROUTE_LICENSE = GPL-2.0+, LGPL-2.1+
TRACEROUTE_LICENSE_FILES = COPYING COPYING.LIB

define TRACEROUTE_BUILD_CMDS
	$(BUILD_MAKE_ENV) VPATH=$(INSTALL_DIR)/usr/lib $(MAKE) $(BUILD_OPTS) \
		CFLAGS="$(BUILD_CFLAGS) -D_GNU_SOURCE" -C $(@D)
endef

define TRACEROUTE_INSTALL_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) $(BUILD_OPTS) \
		prefix=$(INSTALL_DIR)/usr install \
		INSTALL=$(INSTALL) -C $(@D)
endef

$(eval $(generic-package))
