################################################################################
#
# libepoxy
#
################################################################################

LIBEPOXY_VERSION_MAJOR = 1.5
LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).4
LIBEPOXY_SITE = http://ftp.gnome.org/pub/gnome/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
LIBEPOXY_SOURCE = libepoxy-$(LIBEPOXY_VERSION).tar.xz
LIBEPOXY_DEPENDENCIES = pkgconf xutil-macros
LIBEPOXY_LICENSE = MIT
LIBEPOXY_LICENSE_FILES = COPYING
LIBEPOXY_CONF_OPTS += -Dtests=false

ifeq ($(PACKAGE_HAS_LIBGL)$(PACKAGE_XLIB_LIBX11),yy)
LIBEPOXY_CONF_OPTS += -Dglx=yes -Dx11=true
LIBEPOXY_DEPENDENCIES += libgl xlib-libX11
else
LIBEPOXY_CONF_OPTS += -Dglx=no -Dx11=false
endif

$(eval $(meson-package))
