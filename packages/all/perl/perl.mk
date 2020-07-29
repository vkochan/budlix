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

PERL_CONF_OPTS = \
	-des \
	-Dusethreads -Duseshrplib -Doptimize="${BUILD_CFLAGS}" \
	-Dprefix="$(INSTALL_DIR)/usr" \
	-Dcc="$(BUILD_CC)" \
	-Dld="$(BUILD_CC)" \
	-Dccflags="$(BUILD_CFLAGS)" \
	-Dldflags="$(BUILD_LDFLAGS) -lm" \
	-Dinc_version_list=none

define PERL_CONFIGURE_CMDS
	(cd $(@D); $(BUILD_MAKE_ENV) ./Configure $(PERL_CONF_OPTS))
endef

define PERL_BUILD_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) -C $(@D)
endef

define PERL_INSTALL_CMDS
	$(BUILD_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_DEPENDENCE='' install
endef

$(eval $(generic-package))
