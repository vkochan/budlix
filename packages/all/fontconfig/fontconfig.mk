################################################################################
#
# fontconfig
#
################################################################################

FONTCONFIG_VERSION = 2.13.1
FONTCONFIG_SITE = http://fontconfig.org/release
FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
FONTCONFIG_DEPENDENCIES = freetype expat pkgconf gperf util-linux
FONTCONFIG_LICENSE = fontconfig license
FONTCONFIG_LICENSE_FILES = COPYING

FONTCONFIG_CONF_OPTS = \
	--disable-docs \
	--with-cache-dir=$(INSTALL_DIR)/var/cache/fontconfig

$(eval $(autotools-package))
