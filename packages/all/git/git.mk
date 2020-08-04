################################################################################
#
# git
#
################################################################################

GIT_VERSION = 2.26.2
GIT_SOURCE = git-$(GIT_VERSION).tar.xz
GIT_SITE = $(KERNEL_MIRROR)/software/scm/git
GIT_LICENSE = GPL-2.0, LGPL-2.1+
GIT_LICENSE_FILES = COPYING LGPL-2.1
GIT_DEPENDENCIES = zlib pkgconf openssl expat

GIT_CFLAGS = $(BUILD_CFLAGS)

GIT_CONF_OPTS += CFLAGS="$(GIT_CFLAGS)"
GIT_CONF_OPTS += --with-openssl
GIT_CONF_OPTS += --with-expat

GIT_MAKE_OPTS += LIB_4_CRYPTO="`$(PKG_CONFIG_BINARY) --libs libssl libcrypto`"
GIT_MAKE_OPTS += NO_GETTEXT=1

GIT_INSTALL_OPTS = $(GIT_MAKE_OPTS) install

$(eval $(autotools-package))
