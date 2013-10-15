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

PKG_NAME:=ejs
PKG_RELEASE:=1

#
#	Build stable
#
PKG_VERSION:=2.3.2-0
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tgz
PKG_SOURCE_URL:=http://www.ejscript.org/software/
PKG_MD5SUM:=

#
#	Build the latest snapshot from the default trunk
#
#PKG_VERSION:=default
#PKG_SOURCE:=tip.tar.gz
#PKG_SOURCE_URL:= http://hg.embedthis.com/appweb/archive/
#PKG_MD5SUM:=

include $(INCLUDE_DIR)/package.mk

# The files in the .tar.gz are
#    src/all/...
#    src/build/...
#    src/test/...
# and so on
#
# What we want is
#    $(PKG_BUILD_DIR)/all/...
#    $(PKG_BUILD_DIR)/build/...
#    $(PKG_BUILD_DIR)/test/...
# and so on
#
# The following two lines make this happen
#    1.  change tar option to strip out the top-level, src in
#        this case
#    2.  change the tar output to the build directory.  The
#        original tar command was
#        $(HOST_TAR) -C/.. $(1) $(TAR_OPTIONS)

TAR_OPTIONS:=--strip-components 1 $(TAR_OPTIONS)
TAR_CMD=$(HOST_TAR) -C $(1) $(TAR_OPTIONS)

CONFIGURE_VARS=

define Package/ejs
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Server Side Javascript
  URL:=http://www.ejscript.org/
  DEPENDS:=@!avr32 +libpthread
endef

define Package/ejscript/description
 ejscript is a powerful, server side javascript designed for dynamic web
 applications.
endef

CONFIGURE_ARGS=

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) SHOW=1  ARCH=$(ARCH)\
		$(TARGET_CONFIGURE_OPTS) \
		BLD_CC_DYN_LOAD=1
endef

define Package/ejs/install
#	( cd $(PKG_BUILD_DIR) ; $(PKG_BUILD_DIR)/linux-$(ARCH)-default/bin/makeInstall \
		--root=$(1) --install --with-openwrt=1 binary )
	rm -rf $(1)/var
endef

$(eval $(call BuildPackage,ejs))
