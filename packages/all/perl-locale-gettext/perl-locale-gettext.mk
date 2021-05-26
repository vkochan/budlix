################################################################################
#
# perl-locale-gettext
#
################################################################################

PERL_LOCALE_GETTEXT_VERSION = 1.07
PERL_LOCALE_GETTEXT_SOURCE = Locale-gettext-$(PERL_LOCALE_GETTEXT_VERSION).tar.gz
PERL_LOCALE_GETTEXT_SITE = $(CPAN_MIRROR)/authors/id/P/PV/PVANDRY
PERL_LOCALE_GETTEXT_LICENSE = Artistic or GPL-1.0+
PERL_LOCALE_GETTEXT_LICENSE_FILES = LICENSE
PERL_LOCALE_GETTEXT_DISTNAME = Locale-gettext

$(eval $(perl-package))
