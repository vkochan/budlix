################################################################################
#
# libxml2
#
################################################################################

LIBXML2_VERSION = 2.9.10
LIBXML2_SITE = http://xmlsoft.org/sources
LIBXML2_LICENSE = MIT
LIBXML2_LICENSE_FILES = COPYING
LIBXML2_CONFIG_SCRIPTS = xml2-config
LIBXML2_USE_FOR_BUILD = YES
LIBXML2_DEPENDENCIES = pkgconf

LIBXML2_CONF_OPTS = --with-gnu-ld --without-python --without-debug

ifeq ($(CONFIG_PKG_ZLIB),y)
LIBXML2_DEPENDENCIES += zlib
LIBXML2_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
else
LIBXML2_CONF_OPTS += --without-zlib
endif

$(eval $(autotools-package))
