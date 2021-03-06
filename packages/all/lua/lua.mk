################################################################################
#
# lua
#
################################################################################

LUA_VERSION = 5.3.5
LUA_ABIVER = 5.3
LUA_SITE = http://www.lua.org/ftp
LUA_LICENSE = MIT
LUA_USE_FOR_BUILD = YES
LUA_DEPENDENCIES = readline ncurses

LUA_CFLAGS = -Wall -fPIC -DLUA_USE_POSIX
LUA_CFLAGS += -DLUA_USE_DLOPEN
LUA_BUILDMODE = dynamic
LUA_MYLIBS += -ldl

define LUA_LUACONF
	$(SED) 's|#define LUA_ROOT.*|#define LUA_ROOT "$(STAGING_DIR)/usr/"|' $(BUILD_DIR)/src/luaconf.h
endef
LUA_POST_PATCH_HOOKS += LUA_LUACONF

LUA_PREFIX = $(STAGING_DIR)/usr

LUA_MAKE_ENV = \
	AR=$(BUILD_AR) \
	CXX=$(BUILD_CXX) \
	CC="$(BUILD_CC)" \
	$(BUILD_MAKE_ENV)

define LUA_BUILD_CMDS
	$(LUA_MAKE_ENV) $(MAKE) \
	CFLAGS="$(LUA_CFLAGS)" \
	MYLDFLAGS="$(BUILD_LDFLAGS)" \
	MYLIBS="$(LUA_MYLIBS)" \
	BUILDMODE=$(LUA_BUILDMODE) \
	PKG_VERSION=$(LUA_VERSION) -C $(BUILD_DIR)/src all
	sed -e 's|@VERSION@|$(LUA_VERSION)|;s|@ABI@|$(LUA_ABIVER)|;s|@MYLIBS@|$(LUA_MYLIBS)|;s|@PREFIX@|$(LUA_PREFIX)|' \
		$(LUA_PKGDIR)/lua.pc.in > $(BUILD_DIR)/lua.pc
endef

define LUA_INSTALL_CMDS
	$(LUA_MAKE_ENV) $(MAKE) INSTALL_TOP="$(INSTALL_DIR)/usr" -C $(BUILD_DIR) install
	$(INSTALL) -m 0644 -D $(BUILD_DIR)/lua.pc \
		$(INSTALL_DIR)/usr/lib/pkgconfig/lua.pc
endef

$(eval $(generic-package))

LUA_RUN = $(STAGING_DIR)/usr/bin/lua
