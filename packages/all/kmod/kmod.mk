################################################################################
#
# kmod
#
################################################################################

KMOD_VERSION = 27
KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
KMOD_SITE = $(KERNEL_MIRROR)/linux/utils/kernel/kmod
KMOD_LICENSE = LGPL-2.1+ (library)
KMOD_LICENSE_FILES = libkmod/COPYING
KMOD_LICENSE += , GPL-2.0+ (tools)
KMOD_LICENSE_FILES += COPYING
KMOD_DEPENDENCIES = pkgconf zlib xz
KMOD_CONF_OPTS += --without-openssl

$(eval $(autotools-package))
