################################################################################
#
# libevent
#
################################################################################

LIBEVENT_VERSION = 2.1.12
LIBEVENT_SITE = https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)-stable
LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
LIBEVENT_LICENSE = BSD-3-Clause, OpenBSD
LIBEVENT_LICENSE_FILES = LICENSE
LIBEVENT_CONF_OPTS = \
	--disable-libevent-regress \
	--disable-openssl

$(eval $(autotools-package))
