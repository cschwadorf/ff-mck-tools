#!/bin/bash
if [ -z "$FF_RELEASE" ]; then 
	echo "FF_RELEASE Variable muss mit FF_RELEASE=\"stable-22.9.x\"; export FF_RELEASE definiert sein"; 
	exit;
fi
if [ -z "$1" ] || [ -z "$2" ]; then 
	echo "Usage: $0 KeyFile Branch"; 
	exit 1;
fi
if [ ! -e "$1" ] || [ ! -f "$1" ] || [ ! -s "$1" ] || [ ! -r "$1" ]; then
	echo "Keydatei nicht auffindbar/lesbar"
fi
case "$2" in
	stable)
		FF_BRANCH=$2
		;;
	beta)
		FF_BRANCH=$2
		;;
	experimental)
		FF_BRANCH=$2
		;;
	*)
	echo "Branch darf nur experimental, beta oder stable sein"
	exit 1;
esac

cd /ff/gluon
make manifest GLUON_BRANCH=$FF_BRANCH DEFAULT_GLUON_RELEASE=$FF_RELEASE
contrib/sign.sh $1 output/images/sysupgrade/$FF_BRANCH.manifest

rsync -azzh --delete /ff/gluon/output/ root@update01.freifunk.infra.its.local:/lib/gluon/status-page/www/update/$FF_BRANCH
rsync -azh --delete /ff/gluon/output/ web_ff01@images.freifunk-meckenheim.de:/httpdocs/$FF_BRANCH

rm -Rf /ff/archiv/$FF_RELEASE-$FF_BRANCH
mv /ff/gluon/output /ff/archiv/$FF_RELEASE-$FF_BRANCH
