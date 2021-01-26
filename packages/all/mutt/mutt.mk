################################################################################
#
# mutt
#
################################################################################

MUTT_VERSION = 1.14.7
MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
MUTT_LICENSE = GPL-2.0+
MUTT_LICENSE_FILES = GPL
MUTT_DEPENDENCIES += ncurses libidn2 openssl libiconv
MUTT_CONF_OPTS += --enable-iconv --enable-pop --enable-imap
MUTT_CONF_OPTS += --with-ssl=$(INSTALL_DIR)/usr

# Avoid running tests to check for:
#  - target system is *BSD
#  - C99 conformance (snprintf, vsnprintf)
#  - behaviour of the regex library
#  - if mail spool directory is world/group writable
#  - we have a working libiconv
MUTT_CONF_ENV += \
	mutt_cv_bsdish=no \
	mutt_cv_c99_snprintf=yes \
	mutt_cv_c99_vsnprintf=yes \
	mutt_cv_regex_broken=no \
	mutt_cv_worldwrite=yes \
	mutt_cv_groupwrite=yes \
	mutt_cv_iconv_good=yes \
	mutt_cv_iconv_nontrans=no

$(eval $(autotools-package))
