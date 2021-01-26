################################################################################
#
## libiconv
#
#################################################################################

LIBICONV_VERSION = 1.15
LIBICONV_SITE = $(GNU_MIRROR)/libiconv
LIBICONV_INSTALL_STAGING = YES

$(eval $(autotools-package))
