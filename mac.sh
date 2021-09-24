#!/bin/sh

clear
if [ ! -f ".majMAC.tmp" ]; then
  echo "
=======================================================================
Verification de l'installation de YOUTUBE-DL et de ces dépendences ...
(Une demande des droits administrateur peut être demandé pour installer
ou mettre à jour YOUTUBE-DL)
======================================================================="

  if [ ! -f "/usr/local/bin/brew" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    brew update
  fi

  if [ ! -d "/usr/local/Cellar/youtube-dl" ]; then
    brew install youtube-dl
  fi

  if [ ! -d "/usr/local/Cellar/ffmpeg" ]; then
    brew install ffmpeg
  fi

  brew upgrade
  touch .majMAC.tmp
  echo "Verif OK"
fi

echo "=======================================================================
Lancement du script YTdl-Mac ...
======================================================================="

dossier=9
echo "Nom de dossier en US ou FR?
=======================================================================
[1] Français
[2] Américain / Anglais
"
read -r dossier

if [ "$dossier" = 1 ]; then
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
    ./YTdl-MacFR/ytdl-video.sh
  elif [ "$choix" = "2" ]; then
    ./YTdl-MacFR/ytdl-musique.sh
  elif [ "$choix" = "3" ]; then
    ./YTdl-MacFR/ytdl-plvideo.sh
  elif [ "$choix" = "4" ]; then
    ./YTdl-MacFR/ytdl-plmusique.sh
  elif [ "$choix" = "q" ]; then
    echo "=======================================================================
Fin de programme
======================================================================="
  else
    ./mac.sh
  fi
elif [ "$dossier" = 2 ]; then
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
    ./YTdl-MacUS/ytdl-video.sh
  elif [ "$choix" = "2" ]; then
    ./YTdl-MacUS/ytdl-musique.sh
  elif [ "$choix" = "3" ]; then
    ./YTdl-MacUS/ytdl-plvideo.sh
  elif [ "$choix" = "4" ]; then
    ./YTdl-MacUS/ytdl-plmusique.sh
  elif [ "$choix" = "q" ]; then
    echo "=======================================================================
Fin de programme
======================================================================="
  else
    ./mac.sh
  fi
else
  echo "=======================================================================
Fin de programme
======================================================================="
fi

./againOrEnd.sh
