#
# Copyright (C) 2007 OpenWrt.org
# Original port by FreeWRT project.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Alexander Tsvyashchenko       Created OpenWRT package as per Trac ticket 2497
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ucspi-tcp
PKG_VERSION:=0.88
PKG_RELEASE:=1

PKG_SOURCE:=${PKG_NAME}-${PKG_VERSION}.tar.gz
PKG_SOURCE_URL:=http://cr.yp.to/ucspi-tcp/
PKG_MD5SUM:=39b619147db54687c4a583a7a94c9163

include $(INCLUDE_DIR)/package.mk

define Package/ucspi-tcp
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=
  TITLE:=UNIX Client-Server Program Interface for TCP
  URL:=http://cr.yp.to/ucspi-tcp.html
endef

define Package/PKG_NAME/description.
	tcpserver and tcpclient are command-line tools for building
	TCP client-server applications.
endef

define Build/Compile
	TARGET_CC="$(TARGET_CC)" \
	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
	TARGET_RANLIB="$(TARGET_CROSS)ranlib" \
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/ucspi-tcp/install
	$(INSTALL_DIR) $(1)/usr/bin
	(cd $(PKG_BUILD_DIR); \
	$(INSTALL_BIN) tcpserver tcprules tcprulescheck argv0 recordio \
		tcpclient who@ date@ finger@ http@ tcpcat mconnect mconnect-io \
		addcr delcr fixcrio rblsmtpd \
	$(1)/usr/bin)
endef

$(eval $(call BuildPackage,ucspi-tcp))

