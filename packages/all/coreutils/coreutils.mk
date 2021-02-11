################################################################################
#
# coreutils
#
################################################################################

COREUTILS_VERSION = 8.32
COREUTILS_SITE = https://ftp.gnu.org/gnu/coreutils
COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz

$(eval $(autotools-package))
