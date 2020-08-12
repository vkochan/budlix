################################################################################
#
# net-tools
#
################################################################################

NET_TOOLS_VERSION = 479bb4a7e11a4084e2935c0a576388f92469225b
NET_TOOLS_SITE = git://git.code.sf.net/p/net-tools/code
NET_TOOLS_LICENSE = GPL-2.0+
NET_TOOLS_LICENSE_FILES = COPYING

define NET_TOOLS_CONFIGURE_CMDS
	(cd $(@D); yes "" | ./configure.sh config.in )
endef

define NET_TOOLS_BUILD_CMDS
	$(BUILD_OPTS) \
		LDFLAGS="$(BUILD_LDFLAGS)" \
		$(MAKE) -C $(@D)
endef

# install renames conflicting binaries, update does not
# ifconfig & route reside in /sbin for busybox, so ensure we don't end
# up with two versions of those.
define NET_TOOLS_INSTALL_TARGET_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(INSTALL_DIR) update
	mv -f $(INSTALL_DIR)/bin/ifconfig $(INSTALL_DIR)/sbin/ifconfig
	mv -f $(INSTALL_DIR)/bin/route $(INSTALL_DIR)/sbin/route
endef

$(eval $(generic-package))
