################################################################################
#
# tinycc
#
################################################################################

TINYCC_VERSION = 0378168c1318352bf13f24f210a23aa2fbeb1895
TINYCC_SITE = $(call github,TinyCC,tinycc,$(TINYCC_VERSION))
TINYCC_DEPENDENCIES = texinfo
TINYCC_CONF_OPTS = --libdir=$(SYSROOT_DIR)/usr/lib \
		   --includedir=$(SYSROOT_DIR)/usr/include \
		   --libpaths=$(SYSROOT_DIR)/usr/lib:/usr/lib

$(eval $(autotools-package))
