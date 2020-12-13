# Makefile for NoneLinux
#
# Copyright (C) 1999-2005 by Erik Andersen <andersen@codepoet.org>
# Copyright (C) 2006-2014 by the Buildroot developers <buildroot@uclibc.org>
# Copyright (C) 2014-2020 by the Buildroot developers <buildroot@buildroot.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
#

# Delete default rules. We don't use them. This saves a bit of time.
.SUFFIXES:

# we want bash as shell
SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
	 else if [ -x /bin/bash ]; then echo /bin/bash; \
	 else echo sh; fi; fi)

SED = sed -i

# Set O variable if not already done on the command line;
# or avoid confusing packages that can use the O=<dir> syntax for out-of-tree
# build by preventing it from being forwarded to sub-make calls.
ifneq ("$(origin O)", "command line")
O := $(CURDIR)/output
endif

# Check if the current Buildroot execution meets all the pre-requisites.
# If they are not met, Buildroot will actually do its job in a sub-make meeting
# its pre-requisites, which are:
#  1- Permissive enough umask:
#       Wrong or too restrictive umask will prevent Buildroot and packages from
#       creating files and directories.
#  2- Absolute canonical CWD (i.e. $(CURDIR)):
#       Otherwise, some packages will use CWD as-is, others will compute its
#       absolute canonical path. This makes harder tracking and fixing host
#       machine path leaks.
#  3- Absolute canonical output location (i.e. $(O)):
#       For the same reason as the one for CWD.

# Remove the trailing '/.' from $(O) as it can be added by the makefile wrapper
# installed in the $(O) directory.
# Also remove the trailing '/' the user can set when on the command line.
override O := $(patsubst %/,%,$(patsubst %.,%,$(O)))
# Make sure $(O) actually exists before calling realpath on it; this is to
# avoid empty CANONICAL_O in case on non-existing entry.
CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))

# gcc fails to build when the srcdir contains a '@'
ifneq ($(findstring @,$(CANONICAL_O)),)
$(error The build directory can not contain a '@')
endif

CANONICAL_CURDIR = $(realpath $(CURDIR))

# Make sure O= is passed (with its absolute canonical path) everywhere the
# toplevel makefile is called back.
EXTRAMAKEARGS := O=$(CANONICAL_O)

# This is our default rule, so must come first
all:
.PHONY: all

# Save running make version since it's clobbered by the make package
RUNNING_MAKE_VERSION := $(MAKE_VERSION)

# Check for minimal make version (note: this check will break at make 10.x)
MIN_MAKE_VERSION = 3.81
ifneq ($(firstword $(sort $(RUNNING_MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSION))
$(error You have make '$(RUNNING_MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
endif

# absolute path
TOPDIR := $(CURDIR)
DL_DIR := $(TOPDIR)/dl
BASE_DIR := $(CANONICAL_O)
$(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))

PER_PACKAGE_DIR := $(BASE_DIR)/per-package

INSTALL_DIR = $(PER_PACKAGE_DIR)/$($(PKG)_BASENAME)/install
BUILD_DIR = $(PER_PACKAGE_DIR)/$($(PKG)_BASENAME)/build
SYSROOT_DIR = $(BASE_DIR)/sysroot
export STAGING_DIR := $(SYSROOT_DIR)

export TMP_DIR := $(BASE_DIR)/tmp

ZCAT = gzip -d -c
BZCAT = bzcat
XZCAT = xzcat
LZCAT = lzip -d -c
TAR = tar
TAR_OPTIONS = -xf

RSYNC_EXCLUSIONS = \
	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
	--exclude CVS

# Quotes are needed for spaces and all in the original PATH content.
BUILD_PATH :=

# We call make recursively to build packages. The command-line overrides that
# are passed to Buildroot don't apply to those package build systems. In
# particular, we don't want to pass down the O=<dir> option for out-of-tree
# builds, because the value specified on the command line will not be correct
# for packages.
MAKEOVERRIDES :=

# Include some helper macros and variables
include support/misc/utils.mk
include packages/pkg-utils.mk

# bash prints the name of the directory on 'cd <dir>' if CDPATH is
# set, so unset it here to not cause problems. Notice that the export
# line doesn't affect the environment of $(shell ..) calls.
export CDPATH :=

PACKAGES :=

################################################################################
#
# You should probably leave this stuff alone unless you know
# what you are doing.
#
################################################################################

all: install

CONFIG_FILE = $(BASE_DIR)/config.mk

-include $(CONFIG_FILE)
include mirrors.mk
include packages/Makefile.in
include $(sort $(wildcard packages/all/*/*.mk))

# Some global targets do not trigger a build, but are used to collect
# metadata, or do various checks. When such targets are triggered,
# some packages should not do their configuration sanity
# checks. Provide them a BUILDING variable set to 'y' when we're
# actually building and they should do their sanity checks.
#
# We're building in two situations: when MAKECMDGOALS is empty
# (default target is to build), or when MAKECMDGOALS contains
# something else than one of the nobuild_targets.
nobuild_targets := %-enable %-disable source %-source \
	legal-info %-legal-info external-deps _external-deps \
	clean distclean help show-targets graph-depends \
	%-graph-depends %-show-depends %-show-version \
	graph-build graph-size list-defconfigs \
	savedefconfig update-defconfig printvars
ifeq ($(MAKECMDGOALS),)
BUILDING = y
else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
BUILDING = y
endif

# Ensure the virtual package has an implementation defined.
define check-virtual-package
ifeq ($$($(2)_IS_VIRTUAL)$$(PACKAGE_$(2)),YESy)
ifeq ($$(call qstrip,$$(PACKAGE_PROVIDES_$(2))),)
$$(error No implementation selected for virtual package $(1). Configuration error)
endif
endif
endef

ifeq ($(BUILDING),y)
$(foreach pkg,$(call UPPERCASE,$(PACKAGES)),\
	$(eval $(call check-virtual-package,$($(pkg)_NAME),$(pkg))$(sep)))
endif

$(CONFIG_FILE):
	@touch $@

.PHONY: install
install: $(PACKAGES) $(SYSROOT_DIR)
	@$(call MESSAGE,"Finalizing sysroot directory")
	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))


	$(if $(INSTALL_DIR_FILES_LISTS), \
		cat $(INSTALL_DIR_FILES_LISTS)) > $(BASE_DIR)/packages-file-list.txt
	$(if $(HOST_DIR_FILES_LISTS), \
		cat $(HOST_DIR_FILES_LISTS)) > $(BASE_DIR)/packages-file-list-host.txt
	$(if $(STAGING_DIR_FILES_LISTS), \
		cat $(STAGING_DIR_FILES_LISTS)) > $(BASE_DIR)/packages-file-list-staging.txt

SYSROOT_BIN_PATH = $(SYSROOT_DIR)/usr/bin
SYSROOT_LIB_PATH = $(SYSROOT_DIR)/usr/lib

.PHONY: show-packages
show-packages:
	@echo $(sort $(PACKAGES))

# printvars prints all the variables currently defined in our
# Makefiles. Alternatively, if a non-empty VARS variable is passed,
# only the variables matching the make pattern passed in VARS are
# displayed.
.PHONY: printvars
printvars:
	@:
	$(foreach V, \
		$(sort $(filter $(VARS),$(.VARIABLES))), \
		$(if $(filter-out environment% default automatic, \
				$(origin $V)), \
		$(if $(QUOTED_VARS),\
			$(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
			$(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
# ' Syntax colouring...

.PHONY: prepare
prepare: $(SYSROOT_DIR) $(PER_PACKAGE_DIR)

$(SYSROOT_DIR) $(PER_PACKAGE_DIR):
	@mkdir -p $@
