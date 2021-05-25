################################################################################
#
# help2man
#
################################################################################

HELP2MAN_VERSION = 1.47.16
HELP2MAN_SOURCE = help2man-$(HELP2MAN_VERSION).tar.xz
HELP2MAN_SITE = $(GNU_MIRROR)/help2man

define HELP2MAN_FIXUP_PERL_PATH
	$(SED) -e 's|#!/usr/bin/perl -w|#!/usr/bin/env perl|' $(INSTALL_DIR)/usr/bin/help2man
endef

HELP2MAN_POST_INSTALL_HOOKS += HELP2MAN_FIXUP_PERL_PATH

$(eval $(autotools-package))

HELP2MAN = $(STAGING_DIR)/usr/bin/help2man
