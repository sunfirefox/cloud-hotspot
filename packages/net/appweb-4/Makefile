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

define Package/$(PKG_NAME)
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Appweb-4 Web Server
  URL:=http://www.appweb-4server.org/
  DEPENDS:=@!avr32 +libpthread +librt
endef


define Package/$(PKG_NAME)/description
 Appweb-4 is a powerful, compact embedded web server designed for dynamic web
 applications.
endef


define Build/Configure
	$(call Build/Configure/Default)
endef


CONFIGURE_ARGS = \
		PROFILE=release \
                BIT_EJS_DB=1 \
                BIT_EJS_MAIL=1 \
                BIT_EJS_MAPPER=1 \
                BIT_EJS_TAR=1 \
                BIT_EJS_TEMPLATE=1 \
                BIT_EJS_WEB=1 \
                BIT_EJS_ZLIB=1  \
                BIT_ESP_MDB=1 \
                BIT_ESP_SDB=1 \
		BIT_MPR_LOGGING=1 \
        	BIT_MPR_TRACING=1 \
                BIT_PACK_CGI=1 \
		BIT_PACK_DIR=1 \
                BIT_PACK_EJSCRIPT=1 \
                BIT_PACK_ESP=1 \
		BIT_PACK_EST=1 \
                BIT_PACK_OPENSSL=0 \
		BIT_PACK_NANOSSL=0 \
        	BIT_PACK_MATRIXSSL=0 \
		BIT_PACK_PHP=0 \
                BIT_PACK_SQLITE=1 \
                BLD_CC_DYN_LOAD=1


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		-f projects/appweb-linux-openwrt.mk \
		SHOW=1 \
		$(CONFIGURE_ARGS) \
		LBIN=$(STAGING_DIR_HOST)/bin \
		ARCH=$(ARCH)\
		CC=$(TARGET_CC) \
		LD=$(TARGET_LD) 
endef

define Package/$(PKG_NAME)/install
	cd $(PKG_BUILD_DIR) ; $(MAKE) PROFILE=release \
                $(TARGET_CONFIGURE_OPTS) \
                ARCH=$(ARCH) BIT_ROOT_PREFIX=$(1) \
                $(CONFIGURE_ARGS) \
                -f projects/appweb-linux-openwrt.mk \
                installBinary;
	cp $(PKG_BUILD_DIR)/package/linux/openwrt.bin/* $(PKG_BUILD_DIR)/ipkg-ar71xx/$(PKG_NAME)/CONTROL/
	symlinks -c $(PKG_BUILD_DIR)/ipkg-ar71xx/$(PKG_NAME)/usr/local/bin/
endef

$(eval $(call BuildPackage,appweb-4))
