################################################################################
#
# texinfo
#
################################################################################

TEXINFO_VERSION = 6.7
TEXINFO_SOURCE = texinfo-$(TEXINFO_VERSION).tar.xz
TEXINFO_SITE = $(GNU_MIRROR)/texinfo
TEXINFO_USE_FOR_BUILD = YES

$(eval $(autotools-package))
