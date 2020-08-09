################################################################################
#
# eudev
#
################################################################################

EUDEV_VERSION = 3.2.9
EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
EUDEV_LICENSE_FILES = COPYING
EUDEV_DEPENDENCIES = gperf pkgconf util-linux kmod
EUDEV_PROVIDES = udev
EUDEV_CONF_OPTS = \
	--disable-introspection \
	--enable-kmod \
	--enable-blkid

$(eval $(autotools-package))
