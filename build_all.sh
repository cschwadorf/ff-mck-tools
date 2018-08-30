#!/bin/bash
if [ -z "$FF_RELEASE" ]; then 
	echo "FF_RELEASE Variable muss mit FF_RELEASE=\"stable-22.9.x\"; export FF_RELEASE definiert sein"; 
	exit;
fi
cd /ff/gluon
git config --global url.https://github.com/.insteadOf git://github.com/
make clean
make update
start=$(date +%s)
#OPTIONS="BROKEN=1 DEFAULT_GLUON_RELEASE=$FF_RELEASE~exp$(date  '+%Y%m%d%H%M')"
OPTIONS="DEFAULT_GLUON_RELEASE=$FF_RELEASE"
CORES=5

for TARGET in ar71xx-generic ar71xx-tiny ar71xx-nand brcm2708-bcm2708 brcm2708-bcm2709 mpc85xx-generic ramips-mt7621 x86-generic x86-geode x86-64; do
  echo "################# $(date) start building target $TARGET ###########################"
  make clean GLUON_TARGET=$TARGET
  make -j$CORES GLUON_TARGET=$TARGET $OPTIONS || exit 1 
done && echo "alle Targets wurden erfolgreich erstellt im ordner output/"
echo -n "finished: "; date
echo "Dauer: $((($(date +%s)-start)/60)) Minuten"
