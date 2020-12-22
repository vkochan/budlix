################################################################################
#
# berkeleydb
#
################################################################################

# Since BerkeleyDB version 6 and above are licensed under the Affero
# GPL (AGPL), we want to keep this 'bdb' package at version 5.x to
# avoid licensing issues.
# BerkeleyDB version 6 or above should be provided by a dedicated
# package instead.
DB_VERSION = 5.3.28
DB_SITE = http://download.oracle.com/berkeley-db
DB_SOURCE = db-$(DB_VERSION).NC.tar.gz
DB_SUBDIR = build_unix
DB_LICENSE = BerkeleyDB License
DB_LICENSE_FILES = LICENSE

# build directory can't be the directory where configure are there, so..
define DB_CONFIGURE_CMDS
	(cd $(@D)/build_unix; rm -rf config.cache; \
		$(BUILD_OPTS) \
		$(TARGET_CONFIGURE_ARGS) \
		../dist/configure $(QUIET) \
		--prefix=$(INSTALL_DIR)/usr \
		--exec-prefix=$(INSTALL_DIR)/usr \
		--sysconfdir=$(INSTALL_DIR)/usr \
		--with-gnu-ld \
		--with-pic \
		--enable-o_direct \
		--enable-mutexsupport \
	)
endef

define DB_REMOVE_DOCS
	rm -rf $(INSTALL_DIR)/usr/docs
endef
DB_POST_INSTALL_HOOKS += DB_REMOVE_DOCS

$(eval $(autotools-package))
