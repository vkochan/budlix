################################################################################
#
# python
#
################################################################################

PYTHON_VERSION_MAJOR = 2.7
PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).18
PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
PYTHON_SITE = https://python.org/ftp/python/$(PYTHON_VERSION)
PYTHON_LICENSE = Python-2.0, others
PYTHON_LICENSE_FILES = LICENSE
PYTHON_AUTORECONF = YES
PYTHON_DEPENDENCIES = libffi zlib expat

# Make sure that LD_LIBRARY_PATH overrides -rpath.
# This is needed because libpython may be installed at the same time that
# python is called.
# Make python believe we don't have 'hg' and 'svn', so that it doesn't
# try to communicate over the network during the build.
PYTHON_CONF_ENV += \
	LDFLAGS="$(BUILD_LDFLAGS) -Wl,--enable-new-dtags" \
	ac_cv_prog_HAS_HG=/bin/false \
	ac_cv_prog_SVNVERSION=/bin/false

ifeq ($(CONFIG_PKG_READLINE),y)
PYTHON_DEPENDENCIES += readline
else
PYTHON_CONF_OPTS += --disable-readline
endif

ifeq ($(CONFIG_PKG_PYTHON_CURSES),y)
PYTHON_DEPENDENCIES += ncurses
else
PYTHON_CONF_OPTS += --disable-curses
endif

PYTHON_CONF_OPTS += \
	--with-ensurepip=yes \
	--enable-unicode=ucs4 \
	--enable-unicodedata \
	--without-cxx-main \
	--disable-sqlite3 \
	--disable-tk \
	--disable-codecs-cjk \
	--disable-sqlite3 \
	--disable-lib2to3 \
	--disable-ssl \
	--disable-nis \
	--disable-dbm \
	--disable-gdbm \
	--disable-bsddb \
	--disable-bz2 \
	--disable-ossaudiodev \
	--disable-test-modules

# Always install the python-config symlink in the staging tree
define PYTHON_INSTALL_PYTHON_SYMLINK
	ln -sf python2-config $(INSTALL_DIR)/usr/bin/python-config
	ln -sf python2 $(INSTALL_DIR)/usr/bin/python
endef

PYTHON_POST_INSTALL_HOOKS += PYTHON_INSTALL_PYTHON_SYMLINK

# Provided to other packages
PYTHON_PATH = $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/

$(eval $(autotools-package))
