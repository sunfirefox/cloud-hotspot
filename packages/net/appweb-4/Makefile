#
# Copyright (C) 2009-2010 OpenWrt.org
# Copyright (C) 2009 Embedthis Software
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Commercial and other licenses are available from http://www.embedthis.com/.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=appweb-4
PKG_RELEASE:=1

#
#	Build stable
#
PKG_VERSION:=4.4.1-0
PKG_SOURCE:=appweb-$(PKG_VERSION)-src.tgz
PKG_SOURCE_URL:=http://www.appwebserver.org/software/
PKG_MD5SUM:=818c4369c1ac41b31ab0f6f130dc3bb6


include $(INCLUDE_DIR)/package.mk


TAR_OPTIONS:=--strip-components 1 $(TAR_OPTIONS)
TAR_CMD=$(HOST_TAR) -C $(1) $(TAR_OPTIONS)

define Package/appweb-4
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Appweb-4 Web Server
  URL:=http://www.appweb-4server.org/
  DEPENDS:=@!avr32 +libpthread
endef


define Package/appweb-4/description
 Appweb-4 is a powerful, compact embedded web server designed for dynamic web
 applications.
endef


define Build/Configure
	$(call Build/Configure/Default)
endef


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		SHOW=1 \
		-f projects/appweb-linux-release.mk \
		BIT_EJS_DB=1 \
		BIT_EJS_MAIL=1 \
		BIT_EJS_MAPPER=1 \
		BIT_EJS_TAR=1 \
		BIT_EJS_TEMPLATE=1 \
		BIT_EJS_WEB=1 \
		BIT_EJS_ZLIB=1  \
		BIT_ESP_MDB=1 \
		BIT_ESP_SDB=1 \
		BIT_PACK_CGI=1 \
		LBIN=$(STAGING_DIR_HOST)/bin \
		BIT_PACK_EJSCRIPT=1 \
		BIT_PACK_ESP=1 \
		BIT_PACK_OPENSSL=1 \
		BIT_PACK_SQLITE=1 \
		ARCH=$(ARCH)\
		CC=$(TARGET_CC) \
		LD=$(TARGET_LD) \
		BLD_CC_DYN_LOAD=1
endef

define Package/appweb-4/install
#	( cd $(PKG_BUILD_DIR) ; $(PKG_BUILD_DIR)/build/bin/makeInstall \
		--root=$(1) --install --with-openwrt=1 binary )
	rm -rf $(1)/var
endef

$(eval $(call BuildPackage,appweb-4))
