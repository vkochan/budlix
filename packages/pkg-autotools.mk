################################################################################
# Autotools package infrastructure
#
# This file implements an infrastructure that eases development of
# package .mk files for autotools packages. It should be used for all
# packages that use the autotools as their build system.
#
# See the Buildroot documentation for details on the usage of this
# infrastructure
#
# In terms of implementation, this autotools infrastructure requires
# the .mk file to only specify metadata information about the
# package: name, version, download URL, etc.
#
# We still allow the package .mk file to override what the different
# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
# already defined, it is used as the list of commands to perform to
# build the package, instead of the default autotools behaviour. The
# package can also define some post operation hooks.
#
################################################################################


#
# Utility function to upgrade config.sub and config.guess files
#
# argument 1 : directory into which config.guess and config.sub need
# to be updated. Note that config.sub and config.guess are searched
# recursively in this directory.
#
define CONFIG_UPDATE
	for file in config.guess config.sub; do \
		for i in $$(find $(1) -name $$file); do \
			cp support/gnuconfig/$$file $$i; \
		done; \
	done
endef

# This function generates the ac_cv_file_<foo> value for a given
# filename. This is needed to convince configure script doing
# AC_CHECK_FILE() tests that the file actually exists, since such
# tests cannot be done in a cross-compilation context. This function
# takes as argument the path of the file. An example usage is:
#
#  FOOBAR_CONF_ENV = \
#	$(call AUTOCONF_AC_CHECK_FILE_VAL,/dev/random)=yes
AUTOCONF_AC_CHECK_FILE_VAL = ac_cv_file_$(subst -,_,$(subst /,_,$(subst .,_,$(1))))

#
# Hook to update config.sub and config.guess if needed
#
define UPDATE_CONFIG_HOOK
	@$(call MESSAGE,"Updating config.sub and config.guess")
	$(call CONFIG_UPDATE,$(BUILD_DIR))
endef

#
# Hook to gettextize the package if needed
#
define GETTEXTIZE_HOOK
	@$(call MESSAGE,"Gettextizing")
	$(Q)cd $($(PKG)_SRCDIR) && $(GETTEXTIZE) $($(PKG)_GETTEXTIZE_OPTS)
endef

#
# Hook to autoreconf the package if needed
#
define AUTORECONF_HOOK
	@$(call MESSAGE,"Autoreconfiguring")
	$(Q)cd $($(PKG)_SRCDIR) && $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
endef

################################################################################
# inner-autotools-package -- defines how the configuration, compilation and
# installation of an autotools package should be done, implements a
# few hooks to tune the build process for autotools specifities and
# calls the generic package infrastructure to generate the necessary
# make targets
#
#  argument 1 is the lowercase package name
#  argument 2 is the uppercase package name, including a HOST_ prefix
#             for host packages
#  argument 3 is the uppercase package name, without the HOST_ prefix
#             for host packages
#  argument 4 is the type (target or host)
################################################################################

define inner-autotools-package

ifndef $(2)_MAKE
 ifdef $(3)_MAKE
  $(2)_MAKE = $$($(3)_MAKE)
 else
  $(2)_MAKE ?= $$(MAKE)
 endif
endif

ifndef $(2)_AUTORECONF
 ifdef $(3)_AUTORECONF
  $(2)_AUTORECONF = $$($(3)_AUTORECONF)
 else
  $(2)_AUTORECONF ?= NO
 endif
endif

ifndef $(2)_GETTEXTIZE
 ifdef $(3)_GETTEXTIZE
  $(2)_GETTEXTIZE = $$($(3)_GETTEXTIZE)
 else
  $(2)_GETTEXTIZE ?= NO
 endif
endif

$(2)_CONF_ENV			?=
$(2)_CONF_OPTS			?=
$(2)_MAKE_ENV			?=
$(2)_MAKE_OPTS			?=
$(2)_INSTALL_OPTS		?= install

#
# Configure step. Only define it if not already defined by the package
# .mk file. And take care of the differences between host and target
# packages.
#
ifndef $(2)_CONFIGURE_CMDS

# Configure package for target
define $(2)_CONFIGURE_CMDS
	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache && \
	$$(BUILD_OPTS) \
	$$(TARGET_CONFIGURE_ARGS) \
	$$($$(PKG)_CONF_ENV) \
	CONFIG_SITE=/dev/null \
	./configure \
		--prefix="$$(INSTALL_DIR)/usr" \
		--exec-prefix="$$(INSTALL_DIR)/usr" \
		--sysconfdir="$$(INSTALL_DIR)/etc" \
		--localstatedir="$$(INSTALL_DIR)/var" \
		--program-prefix="" \
		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
		--enable-ipv6 \
		$$(NLS_OPTS) \
		$$(SHARED_STATIC_LIBS_OPTS) \
		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
	)
endef
endif

$(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK

ifeq ($$($(2)_AUTORECONF),YES)

# This has to come before autoreconf
ifeq ($$($(2)_GETTEXTIZE),YES)
$(2)_PRE_CONFIGURE_HOOKS += GETTEXTIZE_HOOK
endif
$(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK

$(2)_DEPENDENCIES += automake

endif

#
# Build step. Only define it if not already defined by the package .mk
# file.
#
ifndef $(2)_BUILD_CMDS
define $(2)_BUILD_CMDS
	$$(BUILD_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR)
endef
endif

#
# Target installation step. Only define it if not already defined by
# the package .mk file.
#
ifndef $(2)_INSTALL_CMDS
define $(2)_INSTALL_CMDS
	$$(BUILD_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_OPTS) -C $$($$(PKG)_SRCDIR)
endef
endif

# Call the generic package infrastructure to generate the necessary
# make targets
$(call inner-generic-package,$(1),$(2),$(3),$(4))

endef

################################################################################
# autotools-package -- the target generator macro for autotools packages
################################################################################

autotools-package = $(call inner-autotools-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
