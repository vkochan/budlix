################################################################################
#
# libpng
#
################################################################################

LIBPNG_VERSION = 1.6.37
LIBPNG_SERIES = 16
LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
LIBPNG_LICENSE = Libpng-2.0
LIBPNG_LICENSE_FILES = LICENSE
LIBPNG_DEPENDENCIES = pkgconf zlib
LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config

$(eval $(autotools-package))
