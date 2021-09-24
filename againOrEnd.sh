#!/bin/sh
clear

echo "
=======================================================================
Avez-vous encore besoin de moi?
[O] = Oui
[N] = Non
======================================================================="
read -r reponse

if [ "$reponse" = "O" ]; then

  if [ -f ".majFED.tmp" ]; then
    ./fedora.sh
  elif [ -f ".majPOP.tmp" ]; then
    ./popOs.sh
  elif [ -f ".majMAC.tmp" ]; then
    ./mac.sh
  else
  echo "=======================================================================
Fin de programme ...
=======================================================================
"
  fi

elif [ "$reponse" = "N" ]; then
  echo "=======================================================================
Fin de programme ...
=======================================================================
"
else
  ./againOrEnd.sh
fi
