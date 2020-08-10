################################################################################
#
# mesa
#
################################################################################

# When updating the version, please also update mesa3d-headers
MESA_VERSION = 20.1.4
MESA_SOURCE = mesa-$(MESA_VERSION).tar.xz
MESA_SITE = https://mesa.freedesktop.org/archive
MESA_LICENSE = MIT, SGI, Khronos
MESA_LICENSE_FILES = docs/license.html
MESA_PROVIDES = libgl

MESA_DEPENDENCIES = \
	bison \
	flex \
	python3-mako \
	expat \
	libdrm \
	zlib

MESA_CONF_OPTS = \
	-Dgallium-omx=disabled \
	-Dpower8=false

MESA_CONF_OPTS += -Dllvm=false
MESA_CONF_OPTS += -Dgallium-opencl=disabled

MESA_CONF_OPTS += -Dglx=dri \
		  -Dshared-glapi=true \
		  -Dplatforms=x11,drm \
		  -Ddri-drivers=i915,i965, \
		  -Dgallium-drivers= \
		  -Dgallium-extra-hud=false \
		  -Dvulkan-drivers= \
		  -Dosmesa=classic \
		  -Ddri3=false

# Always enable OpenGL:
#   - Building OpenGL ES without OpenGL is not supported, so always keep opengl enabled.
MESA_CONF_OPTS += -Dopengl=true

# libva and mesa3d have a circular dependency
# we do not need libva support in mesa3d, therefore disable this option
MESA_CONF_OPTS += -Dgallium-va=false \
		  -Dlibunwind=false \
		  -Dgallium-vdpau=false \
		  -Dlmsensors=false \
		  -Dzstd=false


MESA_DEPENDENCIES += \
	xlib-libX11 \
	xlib-libXext \
	xlib-libXdamage \
	xlib-libXfixes \
	xlib-libXrandr \
	xlib-libXxf86vm \
	xorgproto \
	libxcb

$(eval $(meson-package))
