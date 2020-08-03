################################################################################
#
# libopenssl
#
################################################################################

LIBOPENSSL_VERSION = 1.1.1g
LIBOPENSSL_SITE = https://www.openssl.org/source
LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
LIBOPENSSL_LICENSE = OpenSSL or SSLeay
LIBOPENSSL_LICENSE_FILES = LICENSE
LIBOPENSSL_INSTALL_STAGING = YES
LIBOPENSSL_DEPENDENCIES = zlib perl
LIBOPENSSL_BUILD_ARCH = linux-$(shell uname -m)
LIBOPENSSL_CFLAGS = $(BUILD_CFLAGS)
LIBOPENSSL_PROVIDES = openssl

# fixes the following build failures:
#
# - musl
#   ./libcrypto.so: undefined reference to `getcontext'
#   ./libcrypto.so: undefined reference to `setcontext'
#   ./libcrypto.so: undefined reference to `makecontext'
#

ifeq ($(PACKAGE_MUSL),y)
LIBOPENSSL_CFLAGS += -DOPENSSL_NO_ASYNC
endif

define LIBOPENSSL_CONFIGURE_CMDS
	(cd $(@D); \
		$(BUILD_OPTS) \
		./Configure \
		$(LIBOPENSSL_BUILD_ARCH) \
		--prefix=$(INSTALL_DIR) \
		--openssldir=$(INSTALL_DIR)/etc/ssl \
		no-rc5 \
		enable-camellia \
		enable-mdc2 \
		no-tests \
		no-fuzz-libfuzzer \
		no-fuzz-afl \
		shared \
		zlib-dynamic \
	)
	$(SED) "s#-O[0-9s]#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
	$(SED) "s# build_tests##" $(@D)/Makefile
endef

define LIBOPENSSL_BUILD_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) -C $(@D)
endef

define LIBOPENSSL_INSTALL_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) -C $(@D) install
endef

$(eval $(generic-package))
