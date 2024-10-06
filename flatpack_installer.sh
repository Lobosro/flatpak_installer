#!/bin/bash

#Leaving everything readb�le
clear

#Colors!!
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
NC='\033[0m' #I think that is not a color LOL

#Legal Part
echo ""
echo ""
echo -e "${BLUE}        Flatpak Installer  Copyright (C) 2024  Elias Feliciano${NC}"
echo -e "${BLUE}        This program comes with ABSOLUTELY NO WARRANTY; for details go to LICENSE.md.${NC}"
echo -e "${BLUE}        This is free software, and you are welcome to redistribute it${NC}"
echo -e "${BLUE}        under certain conditions; go to LICENSE.md for details.${NC}"
echo ""
echo ""
echo ""
echo ""


#Questions for the program to work
if [[ $LANG = "pt_PT" || $LANG = "pt_PT.UTF-8" || $LANG = "pt_BR" || $LANG = "pt_BR.UTF-8" ]]; then
        echo -e "${YELLOW}Em que repositorio esta o teu pacote ?${NC}"
else
	echo -e "${YELLOW}In what repository is your package ?${NC}"
fi
read rep
if [[ $LANG = "pt_PT" || $LANG = "pt_PT.UTF-8" || $LANG = "pt_BR" || $LANG = "pt_BR.UTF-8" ]]; then
	echo -e "${YELLOW}Qual pacote queres instalar pelo "$rep" ?${NC}"
else
	echo -e "${YELLOW}What package do you want to install from "$rep" ?${NC}"
fi
read package

echo ''
echo ''

#Installation of the flatpak
if [[ $LANG = "pt_PT" || $LANG = "pt_PT.UTF-8" || $LANG = "pt_BR" || $LANG = "pt_BR.UTF-8" ]]; then
        echo -e "${GREEN}Instalando${NC}"
else
        echo -e "${GREEN}Installing${NC}"
fi
flatpak install $rep $package
if [[ $LANG = "pt_PT" || $LANG = "pt_PT.UTF-8" || $LANG = "pt_BR" || $LANG = "pt_BR.UTF-8" ]]; then
        echo -e "${GREEN}Copiando .desktop${NC}"
else
        echo -e "${GREEN}Copying .desktop${NC}"
fi

#Copying the .desktop of the flatpack from <flatpak_home>/files/share/applications to /usr/share/applications
cp $(flatpak info --show-location $package)/files/share/applications/$package.desktop /usr/share/applications/$package.desktop

echo''
if [[ $LANG = "pt_PT" || $LANG = "pt_PT.UTF-8" || $LANG = "pt_BR" || $LANG = "pt_BR.UTF-8" ]]; then
        echo -e "${BLUE}TERMINADO${NC}"
else
        echo -e "${BLUE}FINISHED${NC}"
fi
