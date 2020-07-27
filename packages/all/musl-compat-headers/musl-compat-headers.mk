################################################################################
#
# musl-compat-headers
#
################################################################################

# No main site, just using extra downloads
MUSL_COMPAT_HEADERS_QUEUE_H = http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.70

MUSL_COMPAT_HEADERS_EXTRA_DOWNLOADS = $(MUSL_COMPAT_HEADERS_QUEUE_H)

MUSL_COMPAT_HEADERS_LICENSE = BSD-3-Clause, Public Domain or CC0
MUSL_COMPAT_HEADERS_LICENSE_FILES = queue.h cdefs.h

MUSL_COMPAT_HEADERS_ADD_LIBC_DEPENDENCY = NO

# Copying both headers so legal-info finds them (they are _LICENSE_FILES)
define MUSL_COMPAT_HEADERS_EXTRACT_CMDS
	$(INSTALL) -m 0644 -D $(MUSL_COMPAT_HEADERS_DL_DIR)/$(notdir $(MUSL_COMPAT_HEADERS_QUEUE_H)) $(@D)/queue.h
	$(INSTALL) -m 0644 -D $(MUSL_COMPAT_HEADERS_PKGDIR)/cdefs.h $(@D)/cdefs.h
endef

define MUSL_COMPAT_HEADERS_INSTALL_CMDS
	$(INSTALL) -D -m 0644 $(@D)/queue.h \
		$(INSTALL_DIR)/usr/include/sys/queue.h
	$(INSTALL) -D -m 0644 $(@D)/cdefs.h \
		$(INSTALL_DIR)/usr/include/sys/cdefs.h
endef

$(eval $(generic-package))
