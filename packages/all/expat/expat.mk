################################################################################
#
# expat
#
################################################################################

EXPAT_VERSION = 2.2.9
EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
EXPAT_DEPENDENCIES = pkgconf
EXPAT_LICENSE = MIT
EXPAT_LICENSE_FILES = COPYING

$(eval $(autotools-package))
