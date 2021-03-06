#!/bin/bash
# This script file is used in build cloud hotspot openwrt, weiy <wei.a.yang@gmail.com>
# $1: full_system  mini_system ar71xx_generic 

OPENWRT_DIR_NAME="openwrt."$1
OPENWRT_DIR="${PWD}/${OPENWRT_DIR_NAME}"
CONFIG_FILE_TYPE="config."$1

###############################################################################
if [ ! -d ${OPENWRT_DIR} ]; then
	git clone git://git.openwrt.org/12.09/openwrt.git ${OPENWRT_DIR}
fi

if [ ! -d cloud_hotspot_feed ]; then
	mkdir -p cloud_hotspot_feed
fi

if [ ! -d packages ]; then
	git clone git://git.openwrt.org/12.09/packages.git packages
	git clone http://github.com/brimstone/nodejs-openwrt.git packages/net/nodejs
fi

#echo "make distclean"
#make distclean

# add the specific cloud hotspot packages as a feed
echo "src-link cloud_hotspot ${OPENWRT_DIR}/../cloud_hotspot_feed" > ${OPENWRT_DIR}/feeds.conf
echo "src-link packages ${OPENWRT_DIR}/../packages" >> ${OPENWRT_DIR}/feeds.conf
#echo "src-git  luci git://nbd.name/luci.git" >> ${OPENWRT_DIR}/feeds.conf
${OPENWRT_DIR}/scripts/feeds update
${OPENWRT_DIR}/scripts/feeds install -a -p cloud_hotspot

if [ "$1" == "ar71xx_full" ]; then
	${OPENWRT_DIR}/scripts/feeds install -a -p packages
elif [ "$1" == "ar71xx_hotspot" ]; then
	${OPENWRT_DIR}/scripts/feeds install freeradius2
	${OPENWRT_DIR}/scripts/feeds install radiusclient-ng
	${OPENWRT_DIR}/scripts/feeds install appweb
	${OPENWRT_DIR}/scripts/feeds install appweb-4
	${OPENWRT_DIR}/scripts/feeds install nginx 
	${OPENWRT_DIR}/scripts/feeds install ejs 
	${OPENWRT_DIR}/scripts/feeds install coova-chilli 
	${OPENWRT_DIR}/scripts/feeds install chillispot
fi

# copy over the build config settings and the files directory
cp ${OPENWRT_DIR}/../configs/${CONFIG_FILE_TYPE} ${OPENWRT_DIR}/.config
#cp -r ${OPENWRT_DIR}/../files ${OPENWRT_DIR}

# add patches to some components

# and then build the cloud hotspot firmware...
echo
echo " ================================================= "
echo " To compile this custom openwrt build for cloud hotspot, "
echo " just type make V=99 in the path ${OPENWRT_DIR} "
echo " . If you wish to add or change packages type:"
echo " cd openwrt"
echo " make menuconfig #If you wish to add or change packages."
echo " make V=99"
echo  
echo 
echo " Happy hacking! "
echo " ================================================= "
echo 
