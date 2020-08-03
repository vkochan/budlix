################################################################################
#
# tcpdump
#
################################################################################

TCPDUMP_VERSION = 4.9.3
TCPDUMP_SITE = http://www.tcpdump.org/release
TCPDUMP_LICENSE = BSD-3-Clause
TCPDUMP_LICENSE_FILES = LICENSE
TCPDUMP_CONF_ENV = \
	ac_cv_linux_vers=2 \
	td_cv_buggygetaddrinfo=no \
	PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
TCPDUMP_CONF_OPTS = \
	--without-crypto \
	--with-system-libpcap
TCPDUMP_DEPENDENCIES = libpcap

# make install installs an unneeded extra copy of the tcpdump binary
define TCPDUMP_REMOVE_DUPLICATED_BINARY
	rm -f $(STAGING_DIR)/usr/sbin/tcpdump.$(TCPDUMP_VERSION)
endef

TCPDUMP_POST_INSTALL_HOOKS += TCPDUMP_REMOVE_DUPLICATED_BINARY

$(eval $(autotools-package))
