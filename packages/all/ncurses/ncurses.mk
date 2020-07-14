################################################################################
#
# ncurses
#
################################################################################

NCURSES_VERSION = 6.1
NCURSES_SITE = $(GNU_MIRROR)/ncurses
NCURSES_LICENSE = MIT with advertising clause
NCURSES_LICENSE_FILES = COPYING
NCURSES_CONF_OPTS = \
	--without-cxx \
	--without-cxx-binding \
	--without-ada \
	--without-tests \
	--disable-big-core \
	--without-profile \
	--disable-rpath \
	--disable-rpath-hack \
	--enable-echo \
	--enable-const \
	--enable-overwrite \
	--enable-pc-files \
	--enable-widec \
	--disable-stripping \
	--with-pkg-config-libdir="/usr/lib/pkgconfig"

NCURSES_LIB_SUFFIX = w
NCURSES_LIBS = ncurses menu panel form

define NCURSES_LINK_INSTALLED_LIBS
	$(foreach lib,$(NCURSES_LIBS:%=lib%), \
		ln -sf $(lib)$(NCURSES_LIB_SUFFIX).a $(INSTALL_DIR)/usr/lib/$(lib).a
	)
	ln -sf libncurses$(NCURSES_LIB_SUFFIX).a \
		$(INSTALL_DIR)/usr/lib/libcurses.a

	$(foreach lib,$(NCURSES_LIBS:%=lib%), \
		ln -sf $(lib)$(NCURSES_LIB_SUFFIX).so $(INSTALL_DIR)/usr/lib/$(lib).so
	)
	ln -sf libncurses$(NCURSES_LIB_SUFFIX).so \
		$(INSTALL_DIR)/usr/lib/libcurses.so

	$(foreach pc,$(NCURSES_LIBS), \
		ln -sf $(pc)$(NCURSES_LIB_SUFFIX).pc \
			$(INSTALL_DIR)/usr/lib/pkgconfig/$(pc).pc
	)
endef

NCURSES_POST_INSTALL_TARGET_HOOKS += NCURSES_LINK_INSTALLED_LIBS

# ncurses breaks with parallel build, but takes quite a while to
# build single threaded. Work around it similar to how Gentoo does
define NCURSES_BUILD_CMDS
	$(BUILD_OPTS) $(MAKE1) -C $(@D) DESTDIR=$(INSTALL_DIR) sources
	rm -rf $(@D)/misc/pc-files
	$(BUILD_OPTS) $(MAKE) -C $(@D) DESTDIR=$(INSTALL_DIR)
endef

$(eval $(autotools-package))
