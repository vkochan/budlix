################################################################################
#
# xfont_encodings
#
################################################################################

XFONT_ENCODINGS_VERSION = 1.0.5
XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
XFONT_ENCODINGS_SITE = https://xorg.freedesktop.org/releases/individual/font
XFONT_ENCODINGS_LICENSE = Public Domain
XFONT_ENCODINGS_LICENSE_FILES = COPYING

XFONT_ENCODINGS_DEPENDENCIES = xapp-mkfontscale pkgconf xutil-macros

$(eval $(autotools-package))
