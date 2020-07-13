################################################################################
#
# This file contains various utility functions used by the package
# infrastructure, or by the packages themselves.
#
################################################################################

# Helper functions to determine the name of a package and its
# directory from its makefile directory, using the $(MAKEFILE_LIST)
# variable provided by make. This is used by the *-package macros to
# automagically find where the package is located.
pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))
pkgname = $(lastword $(subst /, ,$(pkgdir)))

# Define extractors for different archive suffixes
INFLATE.bz2  = $(BZCAT)
INFLATE.gz   = $(ZCAT)
INFLATE.lz   = $(LZCAT)
INFLATE.lzma = $(XZCAT)
INFLATE.tbz  = $(BZCAT)
INFLATE.tbz2 = $(BZCAT)
INFLATE.tgz  = $(ZCAT)
INFLATE.xz   = $(XZCAT)
INFLATE.tar  = cat
# suitable-extractor(filename): returns extractor based on suffix
suitable-extractor = $(INFLATE$(suffix $(1)))

EXTRACTOR_PKG_DEPENDENCY.lzma = $(BR2_XZCAT_HOST_DEPENDENCY)
EXTRACTOR_PKG_DEPENDENCY.xz   = $(BR2_XZCAT_HOST_DEPENDENCY)
EXTRACTOR_PKG_DEPENDENCY.lz   = $(BR2_LZIP_HOST_DEPENDENCY)

# extractor-pkg-dependency(filename): returns a Buildroot package
# dependency needed to extract file based on suffix
extractor-pkg-dependency = $(EXTRACTOR_PKG_DEPENDENCY$(suffix $(1)))

# extractor-system-dependency(filename): returns the name of the tool
# needed to extract 'filename', and is meant to be used with
# DL_TOOLS_DEPENDENCIES, in order to check that the necesary tool is
# provided by the system Buildroot runs on.
#
# $(firstword) is used here because the extractor can have arguments,
# like ZCAT="gzip -d -c", and to check for the dependency we only want
# 'gzip'.
extractor-system-dependency = $(if $(EXTRACTOR_PKG_DEPENDENCY$(suffix $(1))),,\
	$(firstword $(INFLATE$(suffix $(1)))))

# rsync the contents of per-package directories
# $1: space-separated list of packages to rsync from
# $2: 'install'
# $3: destination directory
define per-package-rsync
	mkdir -p $(3)
	$(foreach pkg,$(1),\
		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
		$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
		$(3)$(sep))
endef

# prepares the per-package INSTALL_DIR of the current
# package, by rsync the install directories of the
# dependencies of this package. The list of dependencies is passed as
# argument, so that this function can be used to prepare with
# different set of dependencies (download, extract, configure, etc.)
#
# $1: space-separated list of packages to rsync from
define prepare-per-package-directory
	$(call per-package-rsync,$(1),install,$(INSTALL_DIR))
endef
