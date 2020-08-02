################################################################################
#
# bison
#
################################################################################

BISON_VERSION = 3.4.2
BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
BISON_SITE = $(GNU_MIRROR)/bison
BISON_LICENSE = GPL-3.0+
BISON_LICENSE_FILES = COPYING
BISON_USE_FOR_BUILD = YES
BISON_DEPENDENCIES = m4

$(eval $(autotools-package))
