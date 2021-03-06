################################################################################
#
# xcb-proto
#
################################################################################

XCB_PROTO_VERSION = 1.14
XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.xz
XCB_PROTO_SITE = http://xcb.freedesktop.org/dist
XCB_PROTO_LICENSE = MIT
XCB_PROTO_LICENSE_FILES = COPYING
XCB_PROTO_DEPENDENCIES = python

$(eval $(autotools-package))
