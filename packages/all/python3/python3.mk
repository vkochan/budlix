################################################################################
#
# python3
#
################################################################################

PYTHON3_VERSION_MAJOR = 3.8
PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
PYTHON3_LICENSE = Python-2.0, others
PYTHON3_LICENSE_FILES = LICENSE
PYTHON3_DEPENDENCIES = libffi zlib expat
PYTHON3_AUTORECONF = YES
PYTHON3_USE_FOR_BUILD = YES

PYTHON3_CONF_OPTS += \
	--without-ensurepip \
	--without-cxx-main \
	--disable-sqlite3 \
	--disable-tk \
	--with-expat=system \
	--with-system-expat \
	--disable-codecs-cjk \
	--disable-nis \
	--enable-unicodedata \
	--disable-test-modules \
	--disable-idle3 \
	--disable-ossaudiodev

# Make sure that LD_LIBRARY_PATH overrides -rpath.
# This is needed because libpython may be installed at the same time that
# python is called.
# Make python believe we don't have 'hg', so that it doesn't try to
# communicate over the network during the build.
PYTHON3_CONF_ENV += \
	LDFLAGS="$(BUILD_LDFLAGS) -Wl,--enable-new-dtags" \
	ac_cv_prog_HAS_HG=/bin/false

# Some packages may have build scripts requiring python3, whatever is the
# python version chosen for the target.
# Only install the python symlink in the host tree if python3 is enabled
# for the target.
ifeq ($(PACKAGE_PYTHON3),y)
define PYTHON3_INSTALL_SYMLINK
	ln -fs python3 $(INSTALL_DIR)/usr/bin/python
	ln -fs python3-config $(INSTALL_DIR)/usr/bin/python-config
endef

PYTHON3_POST_INSTALL_HOOKS += PYTHON3_INSTALL_SYMLINK
endif

# Provided to other packages
PYTHON3_PATH = "$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/:$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/"

$(eval $(autotools-package))
