################################################################################
#
# gperf
#
################################################################################

GPERF_VERSION = 3.1
GPERF_SITE = $(GNU_MIRROR)/gperf
GPERF_LICENSE = GPL-3.0+
GPERF_LICENSE_FILES = COPYING
GPERF_USE_FOR_BUILD = YES

$(eval $(autotools-package))
