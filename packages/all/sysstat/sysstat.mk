################################################################################
#
# sysstat
#
################################################################################

SYSSTAT_VERSION = 12.2.1
SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
SYSSTAT_LICENSE = GPL-2.0+
SYSSTAT_LICENSE_FILES = COPYING
SYSSTAT_MAKE_OPTS += LFLAGS="$(BUILD_LDFLAGS)"
SYSSTAT_CONF_OPTS = --disable-file-attr \
		    --disable-sensors \
		    sa_dir=$(INSTALL_DIR)/var/log/sa \
		    rcdir=$(INSTALL_DIR)/etc/rc.d \
		    conf_dir=$(INSTALL_DIR)/etc/sysconfig

$(eval $(autotools-package))
