################################################################################
#
# freetype
#
################################################################################

FREETYPE_VERSION = 2.10.2
FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
FREETYPE_MAKE_OPTS = CCexe="$(BUILD_CC)"
FREETYPE_LICENSE = Dual FTL/GPL-2.0+
FREETYPE_LICENSE_FILES = docs/LICENSE.TXT docs/FTL.TXT docs/GPLv2.TXT
FREETYPE_DEPENDENCIES = pkgconf libpng zlib
FREETYPE_CONFIG_SCRIPTS = freetype-config

# since 2.9.1 needed for freetype-config install
FREETYPE_CONF_OPTS += --enable-freetype-config \
		      --with-zlib

FREETYPE_DEPENDENCIES += libpng
FREETYPE_CONF_OPTS += LIBPNG_CFLAGS="`$(STAGING_DIR)/usr/bin/libpng-config --cflags`" \
	LIBPNG_LDFLAGS="`$(STAGING_DIR)/usr/bin/libpng-config --ldflags`"
FREETYPE_LIBPNG_LIBS = "`$(STAGING_DIR)/usr/bin/libpng-config --libs`"

# Extra fixing since includedir and libdir are expanded from configure values
define FREETYPE_FIX_CONFIG_FILE
	$(SED) 's:^includedir=.*:includedir="$${prefix}/include":' \
		-e 's:^libdir=.*:libdir="$${exec_prefix}/lib":' \
		$(INSTALL_DIR)/usr/bin/freetype-config
endef
FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_CONFIG_FILE

# libpng isn't included in freetype-config & freetype2.pc :-/
define FREETYPE_FIX_CONFIG_FILE_LIBS
	$(SED) "s,^Libs.private:,& $(FREETYPE_LIBPNG_LIBS)," \
		$(INSTALL_DIR)/usr/lib/pkgconfig/freetype2.pc
	$(SED) "s,-lfreetype,& $(FREETYPE_LIBPNG_LIBS)," \
		$(INSTALL_DIR)/usr/bin/freetype-config
endef
FREETYPE_POST_INSTALL_HOOKS += FREETYPE_FIX_CONFIG_FILE_LIBS

$(eval $(autotools-package))
