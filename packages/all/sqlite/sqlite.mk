################################################################################
#
# sqlite
#
################################################################################

SQLITE_VERSION = 3340100
SQLITE_CPE_ID_VERSION = 3.34.1
SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
SQLITE_SITE = https://www.sqlite.org/2021
SQLITE_LICENSE = Public domain
SQLITE_LICENSE_FILES = tea/license.terms
SQLITE_CPE_ID_VENDOR = sqlite
SQLITE_INSTALL_STAGING = YES
SQLITE_DEPENDENCIES += ncurses readline
SQLITE_CONF_OPTS += --disable-static \
		    --enable-threadsafe

SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4 \
        	-DSQLITE_ENABLE_COLUMN_METADATA \
		-DSQLITE_ENABLE_FTS3 \
		-DSQLITE_ENABLE_JSON1 \
		-DSQLITE_ENABLE_UNLOCK_NOTIFY \
		-DSQLITE_SECURE_DELETE \
		-DSQLITE_NO_SYNC

SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"

$(eval $(autotools-package))
