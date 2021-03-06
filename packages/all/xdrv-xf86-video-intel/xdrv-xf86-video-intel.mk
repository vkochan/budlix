################################################################################
#
# xdrv-xf86-video-intel
#
################################################################################

XDRV_XF86_VIDEO_INTEL_VERSION = 5ca3ac1a90af177eb111a965e9b4dd8a27cc58fc
XDRV_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
XDRV_XF86_VIDEO_INTEL_LICENSE = MIT
XDRV_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
XDRV_XF86_VIDEO_INTEL_AUTORECONF = YES

# -D_GNU_SOURCE fixes a getline-related compile error in src/sna/kgem.c
# We force -O2 regardless of the optimization level chosen by the user,
# as compiling this package is known to be broken with -Os.
XDRIVER_XF86_VIDEO_INTEL_CONF_ENV = \
	CFLAGS="$(BUILD_CFLAGS) -D_GNU_SOURCE -O2"

XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS = \
	--disable-xvmc \
	--enable-sna \
	--disable-xaa \
	--disable-dga \
	--disable-async-swap

XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = \
	libdrm \
	libpciaccess \
	xlib-libXrandr \
	xorgproto \
	xorg-server

XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += \
	--enable-dri2 \
	--enable-dri3 \
	--enable-uxa

$(eval $(autotools-package))
