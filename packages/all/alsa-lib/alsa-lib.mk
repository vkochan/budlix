################################################################################
#
# alsa-lib
#
################################################################################

ALSA_LIB_VERSION = 1.2.3.2
ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
ALSA_LIB_LICENSE_FILES = COPYING aserver/COPYING
ALSA_LIB_CFLAGS = $(BUILD_CFLAGS)
ALSA_LIB_AUTORECONF = YES

ALSA_LIB_CONF_ENV = \
	CFLAGS="$(ALSA_LIB_CFLAGS)" \
	LDFLAGS="$(BUILD_LDFLAGS) -lm"

$(eval $(autotools-package))
