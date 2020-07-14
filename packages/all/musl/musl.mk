################################################################################
#
# musl
#
################################################################################

MUSL_VERSION = 1.2.0
MUSL_SITE = http://www.musl-libc.org/releases
MUSL_LICENSE = MIT
MUSL_LICENSE_FILES = COPYRIGHT

# musl does not provide an implementation for sys/queue.h or sys/cdefs.h.
# So, add the musl-compat-headers package that will install those files,
# into the staging directory:
#   sys/queue.h:  header from NetBSD
#   sys/cdefs.h:  minimalist header bundled in Buildroot
MUSL_DEPENDENCIES += musl-compat-headers

MUSL_ADD_LIBC_DEPENDENCY = NO

MUSL_BUILD_OPTS = \
	LDFLAGS="$(BUILD_LDFLAGS)" \
	CFLAGS="$(BUILD_CFLAGS)" \
	CPPFLAGS="$(BUILD_CPPFLAGS)" \
	STAGING_DIR="$(STAGING_DIR)"

define MUSL_CONFIGURE_CMDS
	(cd $(@D); \
		$(MUSL_BUILD_OPTS) \
		CFLAGS="$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64,$(BUILD_CFLAGS)) $(MUSL_EXTRA_CFLAGS)" \
		CPPFLAGS="$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64,$(BUILD_CPPFLAGS))" \
		./configure \
			--prefix=/usr \
			--libdir=/lib \
			--enable-static \
			--enable-shared)
endef

define MUSL_BUILD_CMDS
	$(MUSL_BUILD_OPTS) $(MAKE) -C $(@D)
endef

define MUSL_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) DESTDIR=$(INSTALL_DIR) install

	$(SED) -e 's|/usr/include|$(INSTALL_DIR)/usr/include|g' -e 's|/lib|$(INSTALL_DIR)/lib|g' \
               $(INSTALL_DIR)/lib/musl-gcc.specs

	ln -sf $(INSTALL_DIR)/lib/libc.so $(INSTALL_DIR)/lib/ld-*
endef

$(eval $(generic-package))
