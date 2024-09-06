#!/bin/bash

if [ $(whoami) == 'root' ]; then 
	echo 'Please run as a user'
	exit 1
fi

clear
while true;
do 

echo -n 'Choose a customization to install:

1) Generic PostmarketOS customization
2) Gnome for Tablet customization
3) Openchrome installation

(1, 2 | q for quitting)> '
read CHOICE

case $CHOICE in

    1)
        #bash ./krane_customization.sh
        bash -c "$(wget -qLO - https://github.com/*TO_DO*)"
        ;;

    2)
        #bash ./src/gnome_tablet_install.sh
        bash -c "$(wget -qLO - https://github.com/*TO_DO*)"
        ;;

    3)
        #bash ./src/openchrome.sh
        bash -c "$(wget -qLO - https://github.com/*TO_DO*)"

    q)
        exit 0
        ;;

    *)
        clear
        echo '
        Write a valid command
        
        '
        ;;
esac

done