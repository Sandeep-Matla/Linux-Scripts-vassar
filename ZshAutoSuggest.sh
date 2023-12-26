#!/bin/bash
sudo_passwd="sanin"

if [ "$#" -ne 1 ] ; then
	echo "Toggle mode is required ( on , off )"
	exit 3
fi
if [ "$1" = "on" -o "$1" = "ON" ]; then
	echo "$1"
	echo $sudo_passwd | sudo -S echo -e "ZSH_AUTOSUGGEST_HISTORY_IGNORE=" >> ~/.zshrc
	
	source ~/.zshrc							#sourcing won't effect the parent shell that excuting this script.

	echo -e "Auto Suggestion activated \nZSH_AUTOSUGGEST_HISTORY_IGNORE -> none"

elif [ "$1" = "off" -o "$1" = "OFF" ]; then
	echo "$1"
	echo $sudo_passwd | sudo -S echo -e "ZSH_AUTOSUGGEST_HISTORY_IGNORE=*" >> ~/.zshrc
	
	source ~/.zshrc							#sourcing won't effect the parent shell that excuting this script.

	echo -e "Auto Suggestion de-activated \nZSH_AUTOSUGGEST_HISTORY_IGNORE -> *"

else
	echo "Inavlid toggle type \n Use on/off"
fi