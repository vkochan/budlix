################################################################################
#
# wpa_supplicant
#
################################################################################

WPA_SUPPLICANT_VERSION = 2.9
WPA_SUPPLICANT_SITE = http://w1.fi/releases
WPA_SUPPLICANT_LICENSE = BSD-3-Clause
WPA_SUPPLICANT_LICENSE_FILES = README
WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
WPA_SUPPLICANT_SUBDIR = wpa_supplicant
WPA_SUPPLICANT_CFLAGS = $(BUILD_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
WPA_SUPPLICANT_DEPENDENCIES += pkgconf libnl libopenssl readline

WPA_SUPPLICANT_LIBS += -lnl-3 -lm -lpthread
WPA_SUPPLICANT_LIBS += `$(PKG_CONFIG_BINARY) --libs openssl`

define WPA_SUPPLICANT_CONFIGURE_CMDS
	cp $(WPA_SUPPLICANT_PKGDIR)/config $(WPA_SUPPLICANT_CONFIG)
endef

# LIBS for wpa_supplicant, LIBS_c for wpa_cli, LIBS_p for wpa_passphrase
define WPA_SUPPLICANT_BUILD_CMDS
	$(BUILD_MAKE_ENV) CFLAGS="$(WPA_SUPPLICANT_CFLAGS)" \
		LDFLAGS="$(BUILD_LDFLAGS)" BINDIR=/usr/sbin \
		LIBS="$(WPA_SUPPLICANT_LIBS)" LIBS_c="$(WPA_SUPPLICANT_LIBS)" \
		LIBS_p="$(WPA_SUPPLICANT_LIBS)" \
		$(MAKE) CC="$(BUILD_CC)" -C $(BUILD_DIR)/$(WPA_SUPPLICANT_SUBDIR)
endef

define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
	make LIBDIR=$(STAGING_DIR)/usr/lib \
		BINDIR=$(STAGING_DIR)/usr/bin \
		DESTDIR="$(INSTALL_DIR)" install
endef

$(eval $(generic-package))
