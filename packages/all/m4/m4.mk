################################################################################
#
# m4
#
################################################################################

M4_VERSION = 1.4.18
M4_SOURCE = m4-$(M4_VERSION).tar.xz
M4_SITE = $(GNU_MIRROR)/m4
M4_LICENSE = GPL-3.0+
M4_LICENSE_FILES = COPYING

$(eval $(autotools-package))
