################################################################################
#
# xapp-xauth
#
################################################################################

XAPP_XAUTH_VERSION = 1.1
XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
XAPP_XAUTH_LICENSE = MIT
XAPP_XAUTH_LICENSE_FILES = COPYING
XAPP_XAUTH_DEPENDENCIES = xlib-libX11 xlib-libXau xlib-libXext xlib-libXmu

$(eval $(autotools-package))
