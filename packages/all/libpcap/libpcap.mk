################################################################################
#
# libpcap
#
################################################################################

LIBPCAP_VERSION = 1.9.1
LIBPCAP_SITE = http://www.tcpdump.org/release
LIBPCAP_LICENSE = BSD-3-Clause
LIBPCAP_LICENSE_FILES = LICENSE
LIBPCAP_DEPENDENCIES = flex bison

LIBPCAP_CONF_ENV = \
	ac_cv_header_linux_wireless_h=yes \
	CFLAGS="$(LIBPCAP_CFLAGS)"
LIBPCAP_CFLAGS = $(BUILD_CFLAGS)
LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux --without-dag
# Disable dbus to break recursive dependencies
LIBPCAP_CONF_OPTS += --disable-dbus
LIBPCAP_CONFIG_SCRIPTS = pcap-config

ifeq ($(PACKAGE_LIBNL),y)
LIBPCAP_DEPENDENCIES += libnl
LIBPCAP_CFLAGS += "-I$(STAGING_DIR)/usr/include/libnl3"
LIBPCAP_CONF_OPTS += --with-libnl=$(STAGING_DIR)/usr
else
LIBPCAP_CONF_OPTS += --without-libnl
endif

$(eval $(autotools-package))
