################################################################################
#
# flex
#
################################################################################

FLEX_VERSION = 2.6.4
FLEX_SITE = https://github.com/westes/flex/files/981163
FLEX_LICENSE = FLEX
FLEX_LICENSE_FILES = COPYING
FLEX_USE_FOR_BUILD = YES
FLEX_DEPENDENCIES = m4

$(eval $(autotools-package))
