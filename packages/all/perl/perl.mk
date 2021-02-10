################################################################################
#
# perl
#
################################################################################

# When updating the version here, also update utils/scancpan
PERL_VERSION_MAJOR = 30
PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
PERL_SITE = http://www.cpan.org/src/5.0
PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
PERL_LICENSE = Artistic or GPL-1.0+
PERL_LICENSE_FILES = Artistic Copying README
PERL_USE_FOR_BUILD = YES

PERL_CROSS_VERSION = 1.3.4
# DO NOT refactor with the github helper (the result is not the same)
PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)

# We use the perlcross hack to cross-compile perl. It should
# be extracted over the perl sources, so we don't define that
# as a separate package. Instead, it is downloaded and extracted
# together with perl
define PERL_CROSS_EXTRACT
	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
endef
PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT

PERL_CONF_OPTS = \
	-Dprefix="$(INSTALL_DIR)/usr" \
	-Dcc="$(BUILD_CC)" \
	-Dld="$(BUILD_CC)" \
	-Dccflags="$(BUILD_CFLAGS)" \
	-Dldflags="$(BUILD_LDFLAGS) -lm" \
	-Dosname=linux \
	-Dinc_version_list=none

define PERL_CONFIGURE_CMDS
	(cd $(@D); $(BUILD_MAKE_ENV) ./configure $(PERL_CONF_OPTS))
endef

define PERL_BUILD_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) -C $(@D) all
endef

define PERL_INSTALL_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) DESTDIR="$(INSTALL_DIR)" -C $(@D) install.perl install.sym
endef

$(eval $(generic-package))
