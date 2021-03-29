################################################################################
#
# iproute2
#
################################################################################

IPROUTE2_VERSION = 5.6.0
IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
IPROUTE2_SITE = $(KERNEL_MIRROR)/linux/utils/net/iproute2
IPROUTE2_DEPENDENCIES = bison flex pkgconf
IPROUTE2_LICENSE = GPL-2.0+
IPROUTE2_LICENSE_FILES = COPYING

define IPROUTE2_DISABLE_IPTABLES
	# m_xt.so is built unconditionally
	echo "TC_CONFIG_XT:=n" >>$(BUILD_DIR)/config.mk
endef

define IPROUTE2_CONFIGURE_CMDS
	cd $(BUILD_DIR) && $(BUILD_MAKE_ENV) ./configure
	$(IPROUTE2_DISABLE_IPTABLES)
endef

define IPROUTE2_BUILD_CMDS
	$(BUILD_MAKE_ENV) LDFLAGS="$(BUILD_LDFLAGS)" \
		CFLAGS="$(BUILD_CFLAGS) -DXT_LIB_DIR=\\\"/usr/lib/xtables\\\"" \
		$(MAKE) V=1 LIBDB_LIBS=-lpthread \
		DBM_INCLUDE="$(STAGING_DIR)/usr/include" \
		SHARED_LIBS="y" -C $(BUILD_DIR)
endef

define IPROUTE2_INSTALL_CMDS
	$(BUILD_MAKE_ENV) DESTDIR="$(INSTALL_DIR)" $(MAKE) -C $(BUILD_DIR) install
endef

$(eval $(generic-package))
