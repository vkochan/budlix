################################################################################
#
# grep
#
################################################################################

GREP_VERSION = 3.4
GREP_SITE = $(GNU_MIRROR)/grep
GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
GREP_LICENSE = GPL-3.0+
GREP_LICENSE_FILES = COPYING
GREP_DEPENDENCIES = pkgconf

# ensure egrep/fgrep shell wrappers use #!/bin/sh
define GREP_FIXUP_SHEBANG
	$(SED) 's/bash$$/sh/' $(INSTALL_DIR)/usr/bin/[fe]grep
endef
GREP_POST_INSTALL_HOOKS += GREP_FIXUP_SHEBANG

$(eval $(autotools-package))
