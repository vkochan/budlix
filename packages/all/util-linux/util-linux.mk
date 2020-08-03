################################################################################
#
# util-linux
#
################################################################################

UTIL_LINUX_VERSION_MAJOR = 2.35
UTIL_LINUX_VERSION_MINOR = 2
UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).$(UTIL_LINUX_VERSION_MINOR)
UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
UTIL_LINUX_SITE = $(KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)

# README.licensing claims that some files are GPL-2.0 only, but this is not
# true. Some files are GPL-3.0+ but only in tests and optionally in hwclock
# (but we disable that option). rfkill uses an ISC-style license.
UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid), ISC (rfkill)
UTIL_LINUX_LICENSE_FILES = README.licensing \
	Documentation/licenses/COPYING.BSD-3-Clause \
	Documentation/licenses/COPYING.BSD-4-Clause-UC \
	Documentation/licenses/COPYING.GPL-2.0-or-later \
	Documentation/licenses/COPYING.ISC \
	Documentation/licenses/COPYING.LGPL-2.1-or-later

UTIL_LINUX_DEPENDENCIES = pkgconf ncurses readline zlib

UTIL_LINUX_CONF_OPTS += \
	--disable-makeinstall-chown \
	--without-systemd \
	--without-python \
	--with-systemdsystemunitdir=no \
	--with-ncursesw --enable-widechar \
	--enable-all-programs

UTIL_LINUX_CONF_ENV += NCURSESW6_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
UTIL_LINUX_LIBS += -lcurses

UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LIBS)"
UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LIBS)"

$(eval $(autotools-package))
