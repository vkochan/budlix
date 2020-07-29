################################################################################
#
# xutil_util-macros
#
################################################################################

XUTIL_MACROS_VERSION = 1.19.2
XUTIL_MACROS_SOURCE = util-macros-$(XUTIL_MACROS_VERSION).tar.bz2
XUTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
XUTIL_MACROS_LICENSE = MIT
XUTIL_MACROS_LICENSE_FILES = COPYING

$(eval $(autotools-package))
$(eval $(host-autotools-package))
