################################################################################
#
# busybox
#
################################################################################

BUSYBOX_VERSION = 1.31.1
BUSYBOX_SITE = http://www.busybox.net/downloads
BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
BUSYBOX_LICENSE = GPL-2.0
BUSYBOX_LICENSE_FILES = LICENSE

BUSYBOX_CFLAGS = \
	$(BUILD_CFLAGS)

BUSYBOX_LDFLAGS = \
	$(BUILD_LDFLAGS)

# Allows the build system to tweak CFLAGS
BUSYBOX_MAKE_ENV = \
	$(BUILD_MAKE_ENV) \
	CFLAGS="$(BUSYBOX_CFLAGS)" \
	CFLAGS_busybox="$(BUSYBOX_CFLAGS_busybox)"

BUSYBOX_MAKE_OPTS = \
	CC="$(BUILD_CC)" \
	PREFIX="$(INSTALL_DIR)" \
	EXTRA_LDFLAGS="$(BUSYBOX_LDFLAGS)" \
	CONFIG_PREFIX="$(INSTALL_DIR)"

define BUSYBOX_BUILD_CMDS
	cp $(BUSYBOX_PKGDIR)/config $(@D)/.config
	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
endef

define BUSYBOX_INSTALL_CMDS
	cd $(@D); ./applets/install.sh $(INSTALL_DIR) --symlinks --noclobber
endef

$(eval $(generic-package))
