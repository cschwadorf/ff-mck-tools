#!/bin/bash
cd /ff/gluon
start=$(date +%s)
#OPTIONS="BROKEN=1 DEFAULT_GLUON_RELEASE=stable-2.9.11~exp$(date  '+%Y%m%d%H%M')"
OPTIONS="DEFAULT_GLUON_RELEASE=stable-2.9.10"
CORES=5

for TARGET in ar71xx-generic ar71xx-tiny ar71xx-nand brcm2708-bcm2708 brcm2708-bcm2709 mpc85xx-generic ramips-mt7621 x86-generic x86-geode x86-64; do
  echo "################# $(date) start building target $TARGET ###########################"
  make -j$CORES GLUON_TARGET=$TARGET $OPTIONS || exit 1 
done && echo "alle Targets wurden erfolgreich erstellt im ordner output/"
echo -n "finished: "; date
echo "Dauer: $((($(date +%s)-start)/60)) Minuten"
