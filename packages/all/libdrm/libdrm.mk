################################################################################
#
# libdrm
#
################################################################################

LIBDRM_VERSION = 2.4.102
LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
LIBDRM_SITE = https://dri.freedesktop.org/libdrm
LIBDRM_LICENSE = MIT
LIBDRM_CONF_OPTS = -Dcairo-tests=false
LIBDRM_DEPENDENCIES = pkgconf libpciaccess libpthread-stubs

$(eval $(meson-package))
