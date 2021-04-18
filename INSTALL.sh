#This is installer of Myabell!
#It is created some additional folder and file in your machine
#It is also downloaded some required additional software packages so internet is also required during installation.

#!/bin/bash
clear;


echo -e "\n\n"
n="\t  __  __           _         _ _ \n"
n1="\t |  \/  |_  _ __ _| |__  ___| | |\n"
n2="\t | |\/| | || / _\` | '_ \/ -_) | |\n"
n3="\t |_|  |_|\_, \__,_|_.__/\___|_|_|\n"
n4="\t         |__/                    \n"



 echo -e " \e[33m  $n$n1\e[31m$n2\e[32m$n3$n4    \e[0m "




#  \e[32m    |---------------------------------------------------------------------------------------|
#      |	\e[36mMyabell\e[0m                                                                          |
#    \e[32m |	Version - 1.0.0                                                                       |
#      |	Author - Bapon Kar                                                                    |
#      |	Description - GUI Changing file from one type to different type by using ffmpeg.      |
#      |	required packges - ffmpeg                                                             |
#      |	Last Update - 16/07/2020                                                              |
#      |	contact - baponkar600@gmail.com                                                       |
#      |	download link - https://gitlab.com/baponkar/myabell-1.0.0                          |
#      |	Platform - Ubuntu/Linux                                                                    |
#      |---------------------------------------------------------------------------------------|

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

version="1.0.0";
#taking sudo password
read -p "Please enter your sudo password to install additional packages : " -s pass #taking sudo password into pass variable

comp_home_dir="$HOME";
work_dir="$PWD"
cd "$comp_home_dir"
file_list=();
test_file="Myabell-1.0.0";
cd "$comp_home_dir"/"$test_file"; #moving directory location into downloaded Myabeell dir

dt=$(date '+%d/%m/%Y %H:%M:%S'); #date

cd "$comp_home_dir"; #moving into machine home directory
declare -i int=0;
for file in *;
 do
  file_list+="\t$file" ; #getting file and folder details of home directory
  int=$(($int+1));
 done

if [[ "\t${file_list[@]}\t" =~ "\t${test_file}\t" ]];then

 rm -r "$test_file" #removing previous installed directory and files of Myabell
 mkdir "$test_file"; #creating software directory inside of home
 echo "$pass" | sudo -S rm -r /usr/share/applications/Myabell.desktop; #Removing old launcher
 echo "$pass" | sudo -S rm -r /usr/share/icons/Myabell_logo.png; #Removing old  Myabell_logo.png
 echo "Going to install new version-1.0.0 ";

else
 echo "The Myabell-1.0.0 folder is not exists!";
 mkdir $HOME/$test_file; #creating software directory inside of home
 echo "The Myabell-1.0.0 folder have created."
fi
echo -ne '##########                    (2%)\r'
cd "$comp_home_dir"/"Myabell-1.0.0";
#mkdir home; #creating home folder inside of Myabell-1.0.0
#cd home;
#mkdir logo;
#mkdir $HOME/Myabell-1.0.0/script_folder;
#mkdir image;
#mkdir $HOME/Myabell-1.0.0/txt
echo -ne '###############                     (30%)\r'
cd ..; # change directory to Myabell-1.0.0
mkdir $HOME/Myabell-1.0.0/Output;
cd $HOME/Myabell-1.0.0/Output;
mkdir Video; #creating video directory for output video inside of Myabell-1.0.0
cd Video; #change into output video folder to make image-to-video directory
mkdir image-to-video-output;
cd ..; #going back to output directory
mkdir Audio; #creating audio directory for output audio inside of Myabell-1.0.0
mkdir Document; #creating document directory for output document inside of Myabell-1.0.0
mkdir Image; #creating image directory for output vimage inside of Myabell-1.0.0
#mkdir $HOME/Myabell-1.0.0/binary_files
cp -r "$work_dir"/binary_files "$HOME"/Myabell-1.0.0/binary_files
echo -ne '#####################                                     (43%)\r'
cd ..;
mkdir license; #creating license directory for license
mkdir README;
mkdir launcher;
mkdir Icons;
#mkdir $HOME/Myabell-1.0.0/python_files
#mkdir $HOME/Myabell-1.0.0/shell_scripts

cp -r "$HOME"/shell_scripts $HOME/Myabell-1.0.0/shell_scripts
cp -r $work_dir/python_files $HOME/Myabell-1.0.0/python_files

#cp $work_dir/Myabell_logo64.png $HOME/Myabell-1.0.0/Myabell_logo64.png

#cp  $work_dir/mydictionary.py $HOME/Myabell-1.0.0/mydictionary.py
cp $work_dir/data.json $HOME/Myabell-1.0.0/data.json
#chmod +x $work_dir/Myabell-1.0.0/mycalculator.py
#cp "$work_dir"/mycalculator.py $HOME/Myabell-1.0.0/home/script_folder/mycalculator.py
cp -r "$work_dir"/images "$comp_home_dir"/Myabell-1.0.0/images
cp -r "$work_dir"/txt "$HOME"/Myabell-1.0.0/txt #Copying txt folder
#cp "$work_dir"/info.txt "$comp_home_dir"/Myabell-1.0.0/info.txt; #copying info.txt file
#cp "$work_dir"/playerinfo.txt "$comp_home_dir"/Myabell-1.0.0/playerinfo.txt; #copying playerinfo.txt file
cp "$work_dir"/binary_files/prime_check "$comp_home_dir"/Myabell-1.0.0/binary_files/prime_check #Copying prime_check
#cp "$work_dir"/setting.txt "$comp_home_dir"/Myabell-1.0.0/setting.txt  #Copying setting files
#cp "$work_dir"/setting1.txt "$comp_home_dir"/Myabell-1.0.0/setting1.txt
#cp "$work_dir"/mysudoku.py "$comp_home_dir"/Myabell-1.0.0/mysudoku.py
#copying icons images
cd "$work_dir/Icons";
for i in *;
	do
		cp "$i" "$comp_home_dir"/Myabell-1.0.0/Icons/"$i"; #copying icons image
	done
cd ..;

cp "$work_dir"/LICENSE "$comp_home_dir"/Myabell-1.0.0/license/LICENSE; #copying lisense
cp "$work_dir"/README.md  "$comp_home_dir"/Myabell-1.0.0/README/README.md; #copying README file
chmod +x "$work_dir"/shell_scripts/Myabell.sh; #changing mode
#chmod +x file_convert_check.sh
#chmod +x file_converter.sh
#chmod +x file_identifier.sh
cp -r "$work_dir"/shell_scripts "$comp_home_dir"/Myabell-1.0.0/shell_scripts; #copying Myabell.sh file
#cp "$work_dir"/file_convert_check.sh  "$comp_home_dir"/Myabell-1.0.0/home/script_folder/file_convert_check.sh; #copying file_converter_check.sh file
#cp "$work_dir"/file_converter.sh  "$comp_home_dir"/Myabell-1.0.0/home/script_folder/file_converter.sh; #copying file_converter.sh file
#cp "$work_dir"/file_identifier.sh  "$comp_home_dir"/Myabell-1.0.0/home/script_folder/file_identifier.sh; #copying file_identifier.sh file
#chmod +x "$work_dir"/mybrowser.py;

#cp "$work_dir"/mybrowser.py  "$comp_home_dir"/Myabell-1.0.0/mybrowser.py; #copying mybrowser.py file
chmod 755 "$comp_home_dir"/Myabell-1.0.0/shell_scripts/Myabell.sh;

#making Myabell.desktop file
cd "$work_dir"
touch Myabell.desktop
cd ..
content="[Desktop Entry]\nName=Myabell!\nComment=Files converting application.\nExec=$HOME/Myabell-1.0.0/shell_scripts/Myabell.sh\nIcon=/usr/share/icons/Myabell_logo.png\nTerminal=false\nType=Application\nCategories=Utility;\nGenericName[en_IN]=File converting application."; #content of Myabell.desktop file

echo -e "$content" > "$work_dir"/Myabell.desktop;


cp "$work_dir"/Myabell.desktop "$comp_home_dir"/Myabell-1.0.0/launcher/Myabell.desktop; #copying .desktop file into app folder
cp "$work_dir"/INSTALL.sh "$comp_home_dir"/Myabell-1.0.0/INSTALL.sh #copying INSTALL.sh file into Myabell-1.0.0
cp "$work_dir"/UNINSTALL.sh "$comp_home_dir"/Myabell-1.0.0/UNINSTALL.sh #copying UNINSTALL.sh file into Myabell-1.0.0
#cp "$work_dir"/run_time.txt "$comp_home_dir"/Myabell-1.0.0/run_time.txt; #copying run_time.txt
cp "$work_dir/mouse_click.mp3" "$comp_home_dir/Myabell-1.0.0/mouse_click.mp3"; #copying mouse_click.mp3 file
#cp "$work_dir/prime_number_generator.py"  "$comp_home_dir/Myabell-1.0.0/prime_number_generator.py";
chmod +x "$work_dir/shell_scripts/disk_info.sh"
#cp "$work_dir/shell_scripts/disk_info.sh" "$HOME/Myabell-1.0.0/shell_scripts/disk_info.sh"
chmod +x "$work_dir/shell_scripts/scintific_bash_calculator.sh"
#cp "$work_dir/shell_scripts/bash_calculator.sh" "$HOME/Myabell-1.0.0/shell_scripts/bash_calculator.sh"

#cp "$work_dir/quadratic_equation_solve" "$HOME/Myabell-1.0.0/quadratic_equation_solve"

mkdir
#cp "$work_dir/gauess_elimination" "$HOME/Myabell-1.0.0/gauess_elimination"
#cp "$work_dir/determinant" "$HOME/Myabell-1.0.0/determinant"
#cp "$work_dir/determinant" "$HOME/Myabell-1.0.0/mat_transpose"
#cp "$work_dir/lcm" "$HOME/Myabell-1.0.0/lcm"
#cp "$work_dir/shell_scripts/fact.sh" "$HOME/Myabell-1.0.0/shell_scripts/fact.sh"
#cp "$work_dir/mat_product" "$HOME/Myabell-1.0.0/mat_product"
#cp "$work_dir/gcd" "$HOME/Myabell-1.0.0/gcd"
#cp "$work_dir/shell_scripts/devicelist.sh" "$HOME/Myabell-1.0.0/shell_scripts/devicelist.sh"
#cp "$work_dir/shell_scripts/ip_info.sh" "$HOME/Myabell-1.0.0/shell_scripts/ip_info.sh"
#cp "$work_dir/unit_converter.py"  "$HOME/Myabell-1.0.0/unit_converter.py"
echo -ne '#######################################                     (10%)\r'



#copying Myabell.desktop file into /usr/share/applications
echo "$pass" | sudo -S cp "$work_dir"/Myabell.desktop /usr/share/applications/Myabell.desktop; #copying .desktop file for gnome
echo "$pass" | sudo -S cp "$work_dir"/Icons/Myabell_logo.png /usr/share/icons/Myabell_logo.png; #copying icon file for gnome
echo -ne '##########################################                   (15%)\r'

echo "$pass" | sudo -S apt-get install android-tools-adb

#Installing some additional packages
echo "Updating packages..."
echo "$pass" | sudo -S apt-get update -y;    #Updating
if [ "$?" == 0 ];then
 continue;
else
  echo -e "\e[31m You may typed wrong password or see the above message. Try Again Later! or follow manual installation..\e[0m";
  exit;
fi
echo "Installig Python3"
echo "$pass" | sudo apt-get install python3.6;
echo "Installing PYQT5"
echo "$pass" | sudo apt-get install python3-pyqt5;
echo "$pass" | sudo apt install python3-tk
echo "$pass" | sudo apt install python3-pyqt5;
echo "$pass" | yum install qt5-qtbase-devel
#echo "$pass" | yum install PyQt5
echo "Installing yad"
echo "$pass" | sudo apt-get install yad
sudo "$pass" | sudo pip3 install update
echo "$pass" | sudo pip3 install py-sudoku
echo "$pass" | sudo pip3 install playsound
echo "$pass" | sudo pip3 install tkinter
echo "$pass" | sudo pip3 install googletrans
echo "$pass" | sudo pip install PyQtWebEngine

echo -ne '##########################################                   (55%)\r'


echo -ne '##########################################                   (55%)\r'
echo "$pass" | sudo apt-get install curl jq
echo "$pass" | sudo -S apt-get install ffmpeg -y;
echo "Installing ffmpeg package";
if [ "$?" == 0 ];then
 continue;
else
  echo -e "\e[31mNot installed ffmpeg !\e[0m \e[32mOr may be it has installed before in your linux machine.\e[0m";
fi
echo -ne '############################################                 (70%)\r'
echo "$pass" | sudo -S apt-get install zenity -y;
echo "Installing zenity package";
echo "$pass" | sudo -S apt-get install xterm -y
if [ "$?" == 0 ];then
 continue;
else
  echo -e "\e[31mNot installed zenity! \e[0m \e[32mOr may be it has installed before in your linux machine.\e[0m";
fi
echo -ne '################################################               (75%)\r'
echo "$pass" | sudo -S apt-get install enscript -y;
echo "Installing enscript package";
if [ "$?" == 0 ];then
 continue;
else
  echo -e "\e[31mNot installed enscript!\e[0m \e[32m Or may be it has installed before in your linux machine.\e[0m";
fi
echo -ne '##############################################################             (85%)\r'
echo "$pass" | sudo -S apt-get install imagemagick -y;
echo "\e[32mInstalling imagemagick package\e[0m";
echo "$pass" | sudo -S apt-get install bluez -y;
echo -e "\e[32mInstalling bluez package...\e[0m"
echo "$pass" | sudo  -S apt-get install bluez-tools;
echo "$pass" | sudo apt install gawk;
sudo apt-get install python3-pil python3-pil.imagetk;

if [ "$?" == 0 ];then
 continue;
else
  echo -e "\e[31mNot installed imagemagick!\e[0m \e[32m Or may be it has installed before in your linux machine.\e[0m";
fi

echo "$pass" | sudo echo "alias myabell='${HOME}Myabell-1.0.0/shell_script/Myabell.sh'" >> ~/.bashrc

echo "$pass" | sudo echo "alias myabell='${HOME}Myabell-1.0.0/shell_script/Myabell-1.0.0' >> ~/.bashrc  #Creating Command line access for myabel-l1.0.
echo "$pass" | sudo apt-install speedtest-cli;
echo -ne '####################################################################################          (100%)\r'
echo -e "\n-----------------------------------------------------------------\n"
if [ "$?" == 0 ];then
 echo -e "\e[32m\tMyabell-1.0.0 successfully installed in your machine\e[0m"
 exit;
else
  echo -e "\e[31mYou may typed wrong password or see the above message. Try Again Later! or follow manual installation..\e[0m";
  echo -e "\e[32m Please Check Show Application before try again! \e[0m ";
fi
