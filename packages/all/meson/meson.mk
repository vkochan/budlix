################################################################################
#
# meson
#
################################################################################

MESON_VERSION = 0.55.0
MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
MESON_LICENSE = Apache-2.0
MESON_LICENSE_FILES = COPYING
MESON_SETUP_TYPE = setuptools

MESON_DEPENDENCIES = ninja
MESON_NEEDS_PYTHON = python3

# Avoid interpreter shebang longer than 128 chars
define MESON_SET_INTERPRETER
	$(SED) '1s:.*:#!/usr/bin/env python3:' $(INSTALL_DIR)/usr/bin/meson
endef
MESON_POST_INSTALL_HOOKS += MESON_SET_INTERPRETER

$(eval $(python-package))
