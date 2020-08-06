################################################################################
#
# ninja
#
################################################################################

NINJA_VERSION = 1.10.0
NINJA_SITE = $(call github,ninja-build,ninja,v$(NINJA_VERSION))
NINJA_LICENSE = Apache-2.0
NINJA_LICENSE_FILES = COPYING
NINJA_USE_FOR_BUILD = YES

# Although Ninja supports both Python2 and Python3, we enforce Python3
# on the host for the following reason: Meson is the only package
# using Ninja so far and Meson requires Python3. In this way, we
# prevent both Python2 and Python3 from being created on the host,
# which is time consuming and without benefit.
NINJA_DEPENDENCIES = python3

define NINJA_BUILD_CMDS
	(cd $(@D); $(STAGING_DIR)/usr/bin/python3 configure.py --bootstrap)
endef

define NINJA_INSTALL_CMDS
	$(INSTALL) -m 0755 -D $(@D)/ninja $(INSTALL_DIR)/usr/bin/ninja
endef

$(eval $(generic-package))
