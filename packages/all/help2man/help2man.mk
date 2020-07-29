################################################################################
#
# help2man
#
################################################################################

HELP2MAN_VERSION = 1.47.16
HELP2MAN_SOURCE = help2man-$(HELP2MAN_VERSION).tar.xz
HELP2MAN_SITE = $(GNU_MIRROR)/help2man

$(eval $(autotools-package))

HELP2MAN = $(STAGING_DIR)/usr/bin/help2man
