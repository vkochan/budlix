################################################################################
#
# libpthread-stubs
#
################################################################################

LIBPTHREAD_STUBS_VERSION = 0.4
LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(LIBPTHREAD_STUBS_VERSION).tar.bz2
LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist
LIBPTHREAD_STUBS_LICENSE = MIT
LIBPTHREAD_STUBS_LICENSE_FILES = COPYING

$(eval $(autotools-package))
