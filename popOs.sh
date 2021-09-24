#!/bin/sh

clear

if [ ! -f ".majPOP.tmp" ]; then
  echo "
=======================================================================
Verification de l'installation de YOUTUBE-DL et de ces dépendences ...
(Une demande des droits administrateur peut être demandé pour installer
ou mettre à jour YOUTUBE-DL)
======================================================================="

  if [ ! -f "/usr/bin/youtube-dl" ]; then
    sudo apt install youtube-dl
  fi
  if [ ! -f "/usr/bin/ffmpeg" ]; then
    sudo apt install ffmpeg
  fi
  sudo apt update && sudo apt upgrade
  touch .majPOP.tmp
  echo "Verif OK"
fi

echo "=======================================================================
Lancement du script YTdl-LinuxPopOs Debian Ubuntu Mint et Co ...
======================================================================="

choix=9
echo "Que voulez-vous télécharger?
=======================================================================
[1] Vidéo
[2] Musique
[3] Playliste Vidéo
[4] PlayListe Musique
[q] pour quitter ... "
read -r choix

if [ "$choix" = "1" ]; then
    ./YTdl-Linux/ytdl-video.sh
elif [ "$choix" = "2" ]; then
    ./YTdl-Linux/ytdl-musique.sh
elif [ "$choix" = "3" ]; then
    ./YTdl-Linux/ytdl-plvideo.sh
elif [ "$choix" = "4" ]; then
    ./YTdl-Linux/ytdl-plmusique.sh
elif [ "$choix" = "q" ]; then
    echo "=======================================================================
Fin de programme
======================================================================="
else
    ./popOs.sh
fi

./againOrEnd.sh
