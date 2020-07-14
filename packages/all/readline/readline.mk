
################################################################################
#
# readline
#
################################################################################

READLINE_VERSION = 8.0
READLINE_SITE = $(GNU_MIRROR)/readline
READLINE_DEPENDENCIES = ncurses
READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes \
	bash_cv_wcwidth_broken=no
READLINE_LICENSE = GPL-3.0+
READLINE_LICENSE_FILES = COPYING

$(eval $(autotools-package))
