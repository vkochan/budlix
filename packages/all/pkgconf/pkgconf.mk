################################################################################
#
# pkgconf
#
################################################################################

PKGCONF_VERSION = 1.6.1
PKGCONF_SITE = https://distfiles.dereferenced.org/pkgconf
PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz
PKGCONF_LICENSE = pkgconf license
PKGCONF_LICENSE_FILES = COPYING
PKGCONF_USE_FOR_BUILD = YES

PKG_CONFIG_BINARY = $(STAGING_DIR)/usr/bin/pkg-config

define PKGCONF_LINK_PKGCONFIG
	ln -sf pkgconf $(INSTALL_DIR)/usr/bin/pkg-config
endef

define PKGCONF_INSTALL_WRAPPER
	$(INSTALL) -m 0755 -D packages/all/pkgconf/pkg-config.in \
		$(INSTALL_DIR)/usr/bin/pkg-config
	$(SED) 's,@STAGING_SUBDIR@,$(STAGING_SUBDIR),g' \
		$(INSTALL_DIR)/usr/bin/pkg-config
endef

define PKGCONF_SHARED
	$(SED) 's,@STATIC@,,' $(INSTALL_DIR)/usr/bin/pkg-config
endef

PKGCONF_POST_INSTALL_HOOKS += PKGCONF_LINK_PKGCONFIG
PKGCONF_POST_INSTALL_HOOKS += PKGCONF_INSTALL_WRAPPER
PKGCONF_POST_INSTALL_HOOKS += PKGCONF_SHARED

$(eval $(autotools-package))
