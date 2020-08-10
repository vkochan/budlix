################################################################################
#
# xapp-xinit
#
################################################################################

XAPP_XINIT_VERSION = 1.4.1
XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
XAPP_XINIT_DEPENDENCIES = xapp-xauth xlib-libX11
XAPP_XINIT_LICENSE = MIT
XAPP_XINIT_LICENSE_FILES = COPYING
XAPP_XINIT_CONF_OPTS = \
		       MCOOKIE=$(STAGING_DIR)/usr/bin/mcookie \
		       --with-xserver=$(STAGING_DIR)/usr/bin/X

$(eval $(autotools-package))
