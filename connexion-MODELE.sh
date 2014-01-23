#!/bin/bash

#--------------------------------------------------------------------
# A modifier
# Pas d'espace entre la variable, le signe = et la valeur
#--------------------------------------------------------------------
MODELE_USER=MAXIME_LAFARIE
MODELE_USER_PWD=maximetmnt

#--------------------------------------------------------------------
# Ne pas modifier
#--------------------------------------------------------------------
Host=`uname`
if [ "$Host" == "Linux" ]; then
	export PATH=/media/Applis/sqlplus:$PATH
	export LD_LIBRARY_PATH=/media/Applis/sqlplus:$LD_LIBRARY_PATH
fi
if [ "$Host" == "Darwin" ]; then
	export PATH=/Volumes/Applis/SqlPlus:$PATH
	export DYLD_LIBRARY_PATH=/Volumes/Applis/SqlPlus:$DYLD_LIBRARY_PATH
fi
sqlplus $MODELE_USER/$MODELE_USER_PWD@10.2.50.5:1521/BD1

