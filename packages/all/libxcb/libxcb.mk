################################################################################
#
# libxcb
#
################################################################################

LIBXCB_VERSION = 1.14
LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.xz
LIBXCB_SITE = http://xcb.freedesktop.org/dist
LIBXCB_LICENSE = MIT
LIBXCB_LICENSE_FILES = COPYING

LIBXCB_DEPENDENCIES = \
	libxslt xcb-proto xlib-libXdmcp xlib-libXau \
	python pkgconf

LIBXCB_CONF_OPTS = --with-doxygen=no
# libxcb is not python3 friendly, so force the python interpreter
LIBXCB_CONF_OPTS += ac_cv_path_PYTHON=$(STAGING_DIR)/usr/bin/python2

$(eval $(autotools-package))
