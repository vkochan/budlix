################################################################################
#
# openrc
#
################################################################################

OPENRC_VERSION = 0.42.1
OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
OPENRC_LICENSE = BSD-2-Clause
OPENRC_LICENSE_FILES = LICENSE

OPENRC_DEPENDENCIES = ncurses

# set LIBNAME so openrc puts files in proper directories and sets proper
# paths in installed files. Since in buildroot /lib64 and /lib32 always
# points to /lib, it's safe to hardcode it to "lib"
OPENRC_MAKE_OPTS = \
	LIBNAME=lib \
	LIBEXECDIR=$(INSTALL_DIR)/usr/libexec/rc \
	PREFIX=$(INSTALL_DIR) \
	MKPKGCONFIG=no \
	MKSYSVINIT=yes \
	BRANDING="NoneLinux" \
	PKG_PREFIX=$(INSTALL_DIR) \
	CC=$(BUILD_CC)

define OPENRC_BUILD_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) $(OPENRC_MAKE_OPTS) -C $(BUILD_DIR)
endef

define OPENRC_INSTALL_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) $(OPENRC_MAKE_OPTS) -C $(BUILD_DIR) install
	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
		$(INSTALL_DIR)/etc/init.d/sysv-rcs
endef

$(eval $(generic-package))
