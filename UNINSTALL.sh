#This is uninstaller of Myabell
#It is removed additional folder and files which created during installation of Myabell-1.0.1

#!/bin/bash
clear;

n="\t  __  __           _         _ _ \n"
n1="\t |  \/  |_  _ __ _| |__  ___| | |\n"
n2="\t | |\/| | || / _\` | '_ \/ -_) | |\n"
n3="\t |_|  |_|\_, \__,_|_.__/\___|_|_|\n"
n4="\t         |__/                    \n"

 

 echo -e " \e[33m  $n$n1\e[31m$n2\e[32m$n3$n4    \e[0m "
comp_home_dir="$HOME";

#taking sudo password
read -p "Please enter your sudo password to install additional packages : " -s pass #taking password into pass variable
echo "$pass" | sudo -S rm -r "$HOME"/Myabell-1.0.1; #Removing Myabell-1.0.1 folder
echo "$pass" | sudo -S rm -r /usr/share/applications/Myabell.desktop; #Removing launcher
echo "$pass" | sudo -S rm -r /usr/share/icons/Myabell_logo.png; #Removing Myabell_logo.png
sudo apt-get autoclean;
sudo apt-get autoremove;
echo -e "\n"
read -p "Would you like to remove additional packages [Y/n] : " -n 1 choice;
if [[ "$choice" == "y" || "$choice" == "Y" ]] ;then
 sudo apt-get remove ffmpeg;
 sudo apt-get remove zenity;
 sudo apt-get remove enscript;
 sudo apt-get remove imagemagick;
 sudo apt-get remove yad;
 sudo apt-get remove python3.6;
 sudo apt-get remove python3-pyqt5;
 sudo apt-get update;
 sudo apt-get autoclean;
 sudo apt-get autoremove;
 fi
echo -e "\n\e[32m You have successfully remove Myabell-1.0.1\e[0m";
