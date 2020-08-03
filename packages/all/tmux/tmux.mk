################################################################################
#
# tmux
#
################################################################################

TMUX_VERSION = 2.9a
TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
TMUX_LICENSE = ISC
TMUX_LICENSE_FILES = COPYING
TMUX_DEPENDENCIES = libevent ncurses pkgconf

$(eval $(autotools-package))
