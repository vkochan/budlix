################################################################################
#
# libsamplerate
#
################################################################################

LIBSAMPLERATE_VERSION = 0.1.9
LIBSAMPLERATE_SITE = http://www.mega-nerd.com/SRC
LIBSAMPLERATE_DEPENDENCIES = pkgconf
LIBSAMPLERATE_CONF_OPTS = --disable-fftw --program-transform-name=''
LIBSAMPLERATE_LICENSE = BSD-2-Clause
LIBSAMPLERATE_LICENSE_FILES = COPYING
LIBSAMPLERATE_DEPENDENCIES += libsndfile

$(eval $(autotools-package))
