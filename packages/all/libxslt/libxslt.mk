################################################################################
#
# libxslt
#
################################################################################

LIBXSLT_VERSION = 1.1.34
LIBXSLT_SITE = http://xmlsoft.org/sources
LIBXSLT_INSTALL_STAGING = YES
LIBXSLT_LICENSE = MIT
LIBXSLT_LICENSE_FILES = COPYING
LIBXSLT_USE_FOR_BUILD = YES
LIBXSLT_DEPENDENCIES = pkgconf libxml2

LIBXSLT_CONF_OPTS = \
	--with-gnu-ld \
	--without-debug \
	--without-python \
	--with-libxml-prefix=$(STAGING_DIR)/usr
LIBXSLT_CONFIG_SCRIPTS = xslt-config

$(eval $(autotools-package))
