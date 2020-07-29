################################################################################
#
# xfont-util
#
################################################################################

XFONT_UTIL_VERSION = 1.3.2
XFONT_UTIL_SOURCE = font-util-$(XFONT_UTIL_VERSION).tar.bz2
XFONT_UTIL_SITE = http://xorg.freedesktop.org/releases/individual/font
XFONT_UTIL_LICENSE = MIT/BSD-2-Clause
XFONT_UTIL_LICENSE_FILES = COPYING

XFONT_UTIL_DEPENDENCIES = pkgconf

$(eval $(autotools-package))
