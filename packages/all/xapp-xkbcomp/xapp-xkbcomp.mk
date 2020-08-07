################################################################################
#
# xapp_xkbcomp
#
################################################################################

XAPP_XKBCOMP_VERSION = 1.4.3
XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
XAPP_XKBCOMP_LICENSE = MIT
XAPP_XKBCOMP_LICENSE_FILES = COPYING
XAPP_XKBCOMP_DEPENDENCIES = xlib-libX11 xlib-libxkbfile
XAPP_XKBCOMP_CONF_ENV = ac_cv_file___xkbparse_c=yes
XAPP_XKBCOMP_CONF_OPTS = --with-xkb_config_root=$(STAGING_DIR)/usr/share/X11/xkb

$(eval $(autotools-package))
