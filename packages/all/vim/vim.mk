################################################################################
#
# vim
#
################################################################################

VIM_VERSION = 8.2.0000
VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
VIM_DEPENDENCIES = ncurses
VIM_SUBDIR = src
VIM_CONF_ENV = \
	vim_cv_toupper_broken=no \
	vim_cv_terminfo=yes \
	vim_cv_tgetent=zero \
	vim_cv_tty_group=world \
	vim_cv_tty_mode=0620 \
	vim_cv_getcwd_broken=no \
	vim_cv_stat_ignores_slash=yes \
	vim_cv_memmove_handles_overlap=yes \
	ac_cv_sizeof_int=4 \
	ac_cv_small_wchar_t=no

VIM_LICENSE = Charityware
VIM_LICENSE_FILES = README.txt

VIM_CONF_OPTS = \
	--with-tlib=ncurses \
	--enable-gui=no \
	--without-x \
	--disable-acl \
	--disable-gpm \
	--disable-selinux

$(eval $(autotools-package))
