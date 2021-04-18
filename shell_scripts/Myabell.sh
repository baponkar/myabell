#!/bin/bash

clear
echo -e "\n"
n="\t  __  __           _         _ _ \n"
n1="\t |  \/  |_  _ __ _| |__  ___| | |\n"
n2="\t | |\/| | || / _\` | '_ \/ -_) | |\n"
n3="\t |_|  |_|\_, \__,_|_.__/\___|_|_|\n"
n4="\t         |__/                    \n"
echo -e "\n"


 echo -e " \e[33m  $n$n1\e[31m$n2\e[32m$n3$n4    \e[0m "

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#      |-----------------------------------------------------------------------------------------------------------------------------|
#      |	36mMyabell\e[0m                                                  								                |
#      |	Version - 1.0.1                                                                       								|
#      |	Author - Bapon Kar                                                                   								|
#      |	Description - GUI Changing file from one type to different type by using ffmpeg.           		|
#      |	required packges - ffmpeg                                                              							|
#      |	Last Update - 21/07/2020                                                               							|
#      |	contact - baponkar600@gmail.com                                                        						|
#      |	download link - https://gitlab.com/baponkar/my-Myabell                                    				|
#      |	Platform - Linux                                                                      								|
#      |-----------------------------------------------------------------------------------------------------------------------------|

#-------------------------------------initialsetup--------------------------------------------------------------------------------

user="$USER"
cd $HOME/Myabell-1.0.0
declare -i ser_no=0; #running serial number
app_dir=$HOME/Myabell-1.0.0 #assign app_directory

ser_no=$(cat "$app_dir"/txt/run_serial.txt); #reading running serial no
ser_no=$((ser_no+1)); #assign new serial no
echo "$ser_no" > "$app_dir"/txt/run_serial.txt; #changing data of run_serial.txt file in every time after run this programm

cd "$HOME/Myabell-1.0.0/"

#Settings
sound=$(sed -n 1p $HOME/Myabell-1.0.0/txt/setting.txt)
language=$(sed -n 2p $HOME/Myabell-1.0.0/txt/setting.txt)
color=$(sed -n 3p $HOME/Myabell-1.0.0/txt/setting.txt)
font=($(sed -n 4p $HOME/Myabell-1.0.0/txt/setting.txt))
font_name="${font[0]}"
font_size="${font[1]}"


exit_f(){
if [[ "$?" == 1 ]]; then
	exit;
fi
}

path_to_file_name(){
	file_path="$1";
	file_name=`basename "$file_path"`;
}

file_ext_finder(){
	file_name="$1"
	file_ext=${file_name: -3}
}

click(){
	sound=$(sed -n 1p $HOME/Myabell-1.0.0/txt/setting.txt)
	if [[ "$sound" == "on" ]]; then
			ffplay "$HOME/Myabell-1.0.0/mouse_click.mp3" -nodisp -autoexit -loglevel quiet
	fi
}

file_to_without_ext(){
	file_name="$1"
	file_name_split=$(echo "$file_name" | tr "." "\t");

	local declare j=0;
	local declare k=0;
	for i in $file_name_split;
		do
			j=$((j+1)); #total number of content
		done

	file_name_without_ext="";

	for i in $file_name_split;
		do
			k=$((k+1))
			if [[ $k < $j ]]; then
				file_name_without_ext="$i $file_name_without_ext"
			fi
		done
}

file_type_check(){
		extension=$1;
		file_type="";
	        img_ext_list="jpg png jpeg gif bmp tiff exif jpeg jpeg2000"; #Image file extension list
		vid_ext_list="avi flv wmv mov mp4 h264 3gp gif mkv webm"; #Video file extension list
		aud_ext_list="mp3 3gp aiff aac m4p ogg opus wav webm" #Audio file extension list
		doc_ext_list="pdf txt png html doc docx md" ; #Document file extension list

		#finding input file type
  		for extension in $img_ext_list;
   			do
     				if [[ "$extension" == "$file_ext" ]] ;then
      					file_type="image";
     				else
       					continue;
     				fi
   			done;
  		for extension in $vid_ext_list;
   			do
     				if [[ "$extension" == "$file_ext" ]] ;then
      					file_type="video";
      				else
       					continue;
     				fi
   			done;

   		for extension in $aud_ext_list;
   			do
     				if [[ "$extension" == "$file_ext" ]] ;then
      					file_type="audio";
      				else
       					continue;
     				fi
   			done;

   		for extension in $doc_ext_list;
   			do
     				if [[ "$extension" == "$file_ext" ]] ;then
      					file_type="document";
      				else
       					continue;
     				fi
   			done;

   		if [[ ($file_type != "image") && ($file_type != "video") && ($file_type != "audio") && ($file_type != "document") ]]; then
   			file_type="invalid";
   		fi
}

#Declaring some files extension list
img_ext_list="jpg png jpeg gif bmp tiff exif jpeg jpeg2000"; #Image file extension list
vid_ext_list="avi flv wmv mov mp4 h264 3gp gif webm"; #Video file extension list
aud_ext_list="mp3 3gp aiff aac m4p ogg opus wav webm" #Audio file extension list
doc_ext_list="pdf txt png html doc docx md" ; #Document file extension list

#checking input file type
file_type_list="image video audio document";

welcome_message() {
#just displaying Welcome message.

yad --no-buttons  --timeout=2 --text="<span foreground='blue'><b><big><big>\n\n\n\tMyabell! \n\t 1.0.1</big></big></b></span>"   --image "$HOME"/Myabell-1.0.0/Icons/myabell_logo.png --width=600 --height=500 --title "Myabell-1.0.0" --timeout=1 --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center --undecorated --fixed --fontname="$font_name $font_size";
}

option(){

	pvr1=$(sed -n 1p "$app_dir"/txt/menu_sequence.txt)
	pvr2=$(sed -n 2p "$app_dir"/txt/menu_sequence.txt)
	pvr3=$(sed -n 3p "$app_dir"/txt/menu_sequence.txt)
	pvr4=$(sed -n 4p "$app_dir"/txt/menu_sequence.txt)
	pvr5=$(sed -n 5p "$app_dir"/txt/menu_sequence.txt)
	pvr6=$(sed -n 6p "$app_dir"/txt/menu_sequence.txt)
	pvr7=$(sed -n 7p "$app_dir"/txt/menu_sequence.txt)
	pvr8=$(sed -n 8p "$app_dir"/txt/menu_sequence.txt)
	pvr9=$(sed -n 9p "$app_dir"/txt/menu_sequence.txt)
	pvr10=$(sed -n 10p "$app_dir"/txt/menu_sequence.txt)
	pvr11=$(sed -n 11p "$app_dir"/txt/menu_sequence.txt)
	pvr12=$(sed -n 12p "$app_dir"/txt/menu_sequence.txt)
	pvr13=$(sed -n 13p "$app_dir"/txt/menu_sequence.txt)
	pvr14=$(sed -n 14p "$app_dir"/txt/menu_sequence.txt)
	pvr15=$(sed -n 15p "$app_dir"/txt/menu_sequence.txt)
	pvr16=$(sed -n 16p "$app_dir"/txt/menu_sequence.txt)
	pvr17=$(sed -n 17p "$app_dir"/txt/menu_sequence.txt)
	choose_option=$( yad --title="Choose a Option " --width=600 --height=500\
	 --separator="" --list --dclick-action="viewnior" \
	 --column="Please pick a option" "$pvr1" "$pvr2" "$pvr3"  \
	 "$pvr4" "$pvr5" "$pvr6" "$pvr7" "$pvr8" "$pvr9" "$pvr10"  \
	 "$pvr11" "$pvr12" "$pvr13" "$pvr14"  "$pvr15" "$pvr16"  "$pvr17" \
	   --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center \
	    --fontname="$font_name $font_size" --button=gtk-ok:0 --button=gtk-cancel:1);
	 click;

	val=$choose_option

	declare -i i0
	declare -i i1
	declare -i i2
	declare -i i3
	declare -i i4
	declare -i i5
	declare -i i6
	declare -i i7
	declare -i i8
	declare -i i9
	declare -i i10
	declare -i i11
	declare -i i12
	declare -i i13
	declare -i i14
	declare -i i15
	declare -i i16
	#reading previous data
	i0=$(sed -n 1p "$app_dir"/txt/menu_sequence_number_data.txt)
	i1=$(sed -n 2p "$app_dir"/txt/menu_sequence_number_data.txt)
	i2=$(sed -n 3p "$app_dir"/txt/menu_sequence_number_data.txt)
	i3=$(sed -n 4p "$app_dir"/txt/menu_sequence_number_data.txt)
	i4=$(sed -n 5p "$app_dir"/txt/menu_sequence_number_data.txt)
	i5=$(sed -n 6p "$app_dir"/txt/menu_sequence_number_data.txt)
	i6=$(sed -n 7p "$app_dir"/txt/menu_sequence_number_data.txt)
	i7=$(sed -n 8p "$app_dir"/txt/menu_sequence_number_data.txt)
	i8=$(sed -n 9p "$app_dir"/txt/menu_sequence_number_data.txt)
	i9=$(sed -n 10p "$app_dir"/txt/menu_sequence_number_data.txt)
	i10=$(sed -n 11p "$app_dir"/txt/menu_sequence_number_data.txt)
	i11=$(sed -n 12p "$app_dir"/txt/menu_sequence_number_data.txt)
	i12=$(sed -n 13p "$app_dir"/txt/menu_sequence_number_data.txt)
	i13=$(sed -n 14p "$app_dir"/txt/menu_sequence_number_data.txt)
	i14=$(sed -n 15p "$app_dir"/txt/menu_sequence_number_data.txt)
	i15=$(sed -n 16p "$app_dir"/txt/menu_sequence_number_data.txt)
	i16=$(sed -n 17p "$app_dir"/txt/menu_sequence_number_data.txt)
	#Changing data by picking a option
	if [[ "$val"  == "MyBrowser " ]]; then
		i0=$(( i0+1 ));
	elif [[ "$val" == "MyDictionary " ]]; then
		i1=$((i1+1));
	elif [[ "$val"  == "MyPlayer " ]]; then
        	i2=$((i2+1));
	elif [[ "$val" == "FileConversion " ]]; then
        	i3=$((i3+1));
	elif [[ "$val"  == "Calendar " ]]; then
        	i4=$((i4+1));
	elif [[ "$val"  == "Calculator " ]]; then
		i5=$((i5+1));
	elif [[ "$val" == "Terminal " ]]; then
		i6=$((i6+1));
	elif [[ "$val"  == "MyMathematicalCalculation " ]]; then
        	i7=$((i7+1));
	elif [[ "$val" == "MyUnitConverter " ]]; then
        	i8=$((i8+1));
	elif [[ "$val"  == "FileTransfer " ]]; then
        	i9=$((i9+1));
	elif [[ "$val"  == "Game " ]]; then
		i10=$((i10+1));
	elif [[ "$val" == "System Info " ]]; then
		i11=$((i11+1));
	elif [[ "$val"  == "Settings " ]]; then
	        i12=$((i12+1));
	elif [[ "$val" == "About " ]]; then
	        i13=$((i13+1));
	 elif [[ "$val" == "EMICalculator " ]]; then
	        i14=$((i14+1));
	  elif [[ "$val" == "Weather " ]]; then
	        i15=$((i15+1));
	   elif [[ "$val" == "AndroidMirror " ]]; then
	        i16=$((i16+1));

	fi

	#Now storing current choices integer value into txt file
	echo -e "${i0}\n${i1}\n${i2}\n${i3}\n${i4}\n${i5}\n${i6}\n${i7}\n${i8}\n${i9}\n${i10}\n${i11}\n${i12}\n${i13}\n${i14}\n${i15}\n${i16}" > "$app_dir"/txt/menu_sequence_number_data.txt

	declare -A choice_array=( ["MyBrowser"]=$i0 ["MyDictionary"]=$i1 ["MyPlayer"]=$i2 \
       	["FileConversion"]=$i3 ["Calendar"]=$i4 ["Calculator"]=$i5 ["Terminal"]=$i6 \
       	 ["MyMathematicalCalculation"]=$i7 \
       	["MyUnitConverter"]=$i8 ["FileTransfer"]=$i9 ["Game"]=$i10 ["System Info"]=$i11 ["Settings"]=$i12 \
       	["About"]=$i13 ["EMICalculator"]=$i14 ["Weather"]=$i15 ["AndroidMirror"]=$16 )

       	for l in "${!choice_array[@]}"
	do
		echo  $l - ${choice_array[$l]}
	done | sort -rn -k3 > "$app_dir"/txt/sorted_menu_sequence_number_data.txt


	gawk -F- '{print $1}' "$app_dir"/txt/sorted_menu_sequence_number_data.txt > \
	 "$app_dir"/txt/menu_sequence.txt
}

#main function

welcome_message;
option;
#echo $choose_option
if [[ "$choose_option" == "MyBrowser " ]]; then
	cd "$HOME/Myabell-1.0.0/"
	/usr/bin/python3 "$HOME"/Myabell-1.0.0/python_files/mybrowser.py;

elif [[ "$choose_option" == "Weather " ]]; then
	city=$(cat $HOME/Myabell-1.0.0/txt/city.txt)
	wget -q --spider http://google.com  # -q silence mode; --spider do'nt get, just check page availiability
	#Else you can use : echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1

	if [ $? -eq 0 ]; then
		xterm -fa "Courier, Bold" -fs "9" -hold  -bg 'black' -fg 'white' -cu -title "Myabell Weather" -sb -rightbar -geometry 150x75+65+30 -e curl wttr.in/$city
		xterm -fa "Courier, Bold" -fs "9" -hold  -bg 'black' -fg 'white' -cu -title "Myabell Weather" -sb -rightbar -geometry 150x75+65+30 -e curl v2.wttr.in/baksara
	else
		xterm -fa "Courier, Bold" -fs "9" -hold  -bg 'black' -fg 'white' -cu -title "Myabell Weather" -sb -rightbar -geometry 150x75+65+30 -e echo -e "\e[31m\n\n\n\n\n\n\t\t Sorry! You are Offline.\n\t\tThere is No Internet Connection.\n\t\tTo get this feature you need to\n\t\t
		connect with Internet and also select your area name with settings.\n\t\t\t\t\t\tThankYou"
	fi


	curl wttr.in/$city > $HOME/Myabell-1.0.0/txt/weather.txt
	#yad --text-info < $HOME/Myabell-1.0.0/txt/weather.txt \
 	 #--back=gray --fore=powderblue --fontname="$font_name $font_size" \
 	#--width=600 --height=500 --no-buttons --title="Myabell Weather"  \
 	#--window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center \
 	#--fontname="$font_name $font_size";

elif [[ "$choose_option" == "EMICalculator "  ]]; then
	$HOME/Myabell-1.0.0/shell_scripts/emi_calculator.sh
	
elif [[ "$choose_option" == "AndroidMirror " ]]; then
	gnome-terminal --hide-menubar  --title="Myable System Inofo" -e adb shell screenrecord --output-format=h264 - | ffplay - 
	
elif [[ "$choose_option" == "MyDictionary " ]]; then
	dict_option=$( yad --title="Choose a Option " --width=600 --height=500\
	 --separator="" --list --dclick-action="viewnior" \
	 --column="Please pick a option" "English to English" "English to Bengali"
	   --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center \
	    --fontname="$font_name $font_size" --button=gtk-ok:0 --button=gtk-cancel:1);
	 click;
	 if [[ $dict_option == "English to English"  ]]; then
    		/usr/bin/python3 $HOME/Myabell-1.0.0/python_files/mydictionary.py
    	elif [[ $dict_option == 	"English to Bengali" ]]; then
    		/usr/bin/python3 $HOME/Myabell-1.0.0/python_files/eng_to_beng_dictionary.py
    	fi	

elif [[ "$choose_option" == "Terminal " ]]; then
	cd $HOME/Myabell-1.0.0/
	gnome-terminal --title="Myable Terminal";

elif [[ "$choose_option" == "MyPlayer " ]]; then
	yad --text-info < $HOME/Myabell-1.0.0/txt/playerinfo.txt \
	 --back=gray --fore=powderblue --fontname="$font_name $font_size" \
 	--width=700 --height=600 --timeout="2"  --title="Myabell-1.0.0" \
 	 --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center;
 	click;

	mid_file=$(yad --width=600 --height=500 --file --title="Select a media Audio/video file for play." \
	 --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center --fontname \
	 ="$font_name $font_size "); #choosing media file for play
	 click;
	path_to_file_name "$mid_file";
	mid_file_name=$file_name
	echo "file name -> $mid_file_name"
	file_ext_finder "$mid_file_name";
	mid_file_ext=$file_ext;
	echo "file exten -> $mid_file_ext"
	file_type_check $mid_file_ext;
	mid_file_type=$file_type;
	echo "file type -> $mid_file_type"

	if [[ $mid_file_type == "audio" ]]; then
		ffplay "$mid_file" -x 500 -y 400 -window_title "My Player" -showmode 1;
	elif [[ $mid_file_type == "video" ]]; then
		ffplay "$mid_file" -x 800 -y 600 -window_title "My Player" -showmode 0;
	else
		yad --text-info < $HOME/Myabell-1.0.0/txt/playerabout.txt\
		 --back=gray --fore=powderblue --fontname="$font_name $font_size"\
 		--width=600 --height=500 --timeout="1"  --title="Myabell-1.0.0"\
 		 --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center;
 		click;
	fi
elif [[ "$choose_option" == "Calendar " ]]; then
	yad --calendar --title="Myabell" --width=600 --height=400\
	 --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center --show-weeks;

elif [[ "$choose_option" == "Calculator " ]]; then
	/usr/bin/python3 $HOME/Myabell-1.0.0/python_files/mycalculator.py

elif [[ "$choose_option" == "MyMathematicalCalculation " ]]; then

	math_option=$(yad --title="Choose Mathematical Option" \
	--width=600 --height=500 --separator="" --list --dclick-action="viewnior" \
	 --column="Please Pick a option"  "Prime Number Check" "Scientific Bash Calculator" \
	 "Quadratic Equation Solve" \
	"Gauess Elimination Method" "Determinant" "Matrix Transpose" "LCM" \
	"Factorial" "Matrix Multiplication" "GCD"  --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center --fontname="$font_name $font_size");
	 click;

	 if [[ "$math_option" == "Prime Number Check"  ]]; then
	 	xterm -fa "$font_name" -fs "$font_size" -hold -bg 'white' \
	 	 -fg 'blue' $HOME/Myabell-1.0.0/binary_files/prime_check -title "Myabell Prime Check"

	 elif [[ "$math_option" == "Scientific Bash Calculator" ]] ; then
	 	xterm -fa "$font_name" -fs "$font_size" -hold  -bg 'white' -fg \
	 	 'blue' -fs '30' -title "Myabell Bash Calculator" $HOME/Myabell-1.0.0/shell_scripts/bash_calculator.sh;

	 elif [[ "$math_option" == "Quadratic Equation Solve" ]]; then
	 	xterm -fa "$font_name" -fs "$font_size" -hold  -bg 'white' -fg \
	 	 'blue' -fs '30' -title "Myabell Quadratic Equation Solve" $HOME/Myabell-1.0.0/binary_files/quadratic_equation_solve;

	  elif [[ "$math_option" == "Gauess Elimination Method" ]]; then
	 	xterm -fa "$font_name" -fs "$font_size" -hold  -bg 'white' -fg \
	 	 'blue' -fs '30' -title "Myabell Gauess Elimination" $HOME/Myabell-1.0.0/binary_files/gauess_elimination

	 elif [[ "$math_option" == "Determinant" ]]; then
	 	xterm -fa "$font_name" -fs "$font_size" -hold  -bg 'white' -fg 'blue' \
	 	 -fs '30' -title "Myabell Find Determinant Value" $HOME/Myabell-1.0.0/binary_files/determinant

	elif [[ "$math_option" == "Matrix Transpose" ]]; then
	 	xterm -fa "$font_name" -fs "$font_size" -hold  -bg 'white' -fg 'blue' \
	 	 -fs '30' -title "Myabell Matrix Transpose" $HOME/Myabell-1.0.0/binary_files/mat_transpose

	elif [[ "$math_option" == "LCM" ]]; then
	 	xterm -fa "$font_name" -fs "$font_size" -hold  -bg 'white' -fg 'blue' -fs \
	 	 '30' -title "Myabell LCM" $HOME/Myabell-1.0.0/binary_files/lcm

	elif [[ "$math_option" == "Factorial" ]]; then
	 	xterm -fa "$font_name" -fs "$font_size" -hold  -bg 'white' -fg 'blue' -fs \
	 	 '30' -title "Myabell Factorial" $HOME/Myabell-1.0.0/shell_scripts/fact.sh

	 elif [[ "$math_option" == "Matrix Multiplication" ]]; then
	 	xterm -fa "$font_name" -fs "$font_size" -hold  -bg 'white' -fg 'blue' -fs \
	 	 '30' -title "Myabell Matrix Multiplication" $HOME/Myabell-1.0.0/binary_files/shell_scripts/mat_product

	  elif [[ "$math_option" == "GCD" ]]; then
	 	xterm -fa "$font_name" -fs "$font_size" -hold  -bg 'white' -fg 'blue' -fs \
	 	 '30' -title "Myabell GCD" $HOME/Myabell-1.0.0/binary_files/gcd
	fi


elif [[ "$choose_option" == "MyUnitConverter " ]] ; then
	/usr/bin/python3 $HOME/Myabell-1.0.0/python_files/unit_converter2.py


elif [[ "$choose_option" == "FileTransfer " ]]; then

	transfer_option=$( \
	yad --title="Choose a Option " --width=600 --height=500 --separator="" \
	--list --dclick-action="viewnior"\
	 --column="Please Pick a option"  "Via Bluetooth" "Via Wi-Fi" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center --fontname="$font_name $font_size");
	 click;

	 if [[ "$transfer_option" == "Via Bluetooth" ]]; then
	 	bluetooth_option=$( \
		yad --title="Choose a Option " --width=600 --height=500 --separator="" \
		--list --dclick-action="viewnior"\
	 	--column="Please Pick a option"  "Send" "Search..." \
		 --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center \
		 --fontname="$font_name $font_size");
		 if [[ "$bluetooth_option" == "Send" ]]; then
		 	rfkill unblock bluetooth
		 	bluetooth-sendto
		 	if [[ $? == 0 ]] ;then
		 		rfkill block bluetooth
		 	fi
		 elif [[ "$bluetooth_option" == "Search..." ]]; then
		 	rfkill unblock bluetooth
		 	xterm -fa "$font_name" -fs "$font_size" -hold  -bg 'white' \
		 	-fg 'blue' -fs '30' -title "Myabell" $HOME/Myabell-1.0.0/shell_scripts/devicelist.sh #Not working
		 	if [[ $? == 0 ]] ;then
		 		rfkill block bluetooth
		 	fi
		 fi

	 elif [[ "$transfer_option" -eq "Via Wi-Fi" ]] ; then
	 	echo "Not working now";
	 	exit;
	 fi

elif [[ "$choose_option" == "Game " ]]; then
	game_option=$(yad --title="Choose a option" --width=600 --height=500\
	 --separator="" --list --dclick-action="viewnior" --column="Select your game"\
	  "Sudoku" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
	   --center --fontname="$font_name $font_size")
	click;
	game_level=$(yad --title="Select Level" --width=600 --height=500\
	 --separator="" --list --dclick-action="viewnior" --column="Level"\
	  "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
	   --center --fontname="$font_name $font_size")

	   rand=$(echo $((1 + RANDOM % 10)))
	   level=$(echo "scale=10; $game_level * 0.0049*$rand" | bc)
	   sed -i s/difficulty\(.*\)/difficulty\($level\)/ $HOME/Myabell-1.0.0/python_files/mysudoku.py
	   sed -i s/difficulty\(.*\)/difficulty\($level\)/ $HOME/Myabell-1.0.0/python_files/mysudoku_solve.py
	if [[ $game_option == "Sudoku" ]]; then
		/usr/bin/python3 $HOME/Myabell-1.0.0/python_files/mysudoku.py
		yad --text-info < $HOME/Myabell-1.0.0/python_files/sudoku_question.txt --back=gray --fore=powderblue --fontname="$font_name $font_size" --width=600 --height=500 --title="My Sudoku Question" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center --fontname="$font_name $font_size";
 		click;

		yad --text-info < $HOME/Myabell-1.0.0/python_files/sudoku_solve.txt --back=gray --fore=powderblue --fontname="$font_name $font_size" --width=600 --height=500 --title="My Sudoku Solution" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center --fontname="$font_name $font_size";
 		click;

	fi

elif [[ "$choose_option" == "System Info " ]]; then
	system_option=$( \
	yad --title="Choose a Option " --width=600 --height=500 --separator=""\
	 --list --dclick-action="viewnior"\
	 --column="Please Pick a option"  "Disk Info." "Network Info" \
	"System Details" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
	 --center --fontname="$font_name $font_size");
	click;

	if [[ "$system_option" == "Disk Info." ]]; then
		gnome-terminal --hide-menubar -e $HOME/Myabell-1.0.0/shell_scripts/disk_info.sh --title="Myable System Inofo"

	elif [[ "$system_option" == "Network Info" ]]; then
		$HOME/Myabell-1.0.0/shell_scripts/ip_info.sh > $HOME/Myabell-1.0.0/txt/network_info.txt
		$HOME/Myabell-1.0.0/shell_scripts/speedtest.sh >> $HOME/Myabell-1.0.0/txt/network_info.txt
		yad --text-info < $HOME/Myabell-1.0.0/txt/network_info.txt \
 			 --back=gray --fore=powderblue --fontname="$font_name $font_size"\
 			--width=600 --height=500 --no-buttons --title="Myabell-1.0.1" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center \
 			 --fontname="$font_name $font_size";
		rm $HOME/Myabell-1.0.0/txt/network_info.txt

	elif [[ "$system_option" == "System Details" ]]; then
		system_details=$(yad --title="Choose a Option " --width=600\
		 --height=500 --separator="" --list --dclick-action="viewnior" \
		 --column="Please Pick a option"  "OS" "Kernal" \
		"Hardware Info." --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
		 --center --fontname="$font_name $font_size");
		click;
		 $HOME/Myabell-1.0.0/shell_scripts/device_detail.sh > $HOME/Myabell-1.0.0/txt/device_detail.txt
		 yad --text-info < $HOME/Myabell-1.0.0/txt/device_detail.txt \
 			 --back=gray --fore=blue --fontname="$font_name $font_size" \
 			--width=1000 --height=800 --no-buttons --title="Myabell-1.0.1" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center \
 			 --fontname="$font_name $font_size";
		 rm $HOME/Myabell-1.0.0/txt/device_detail.txt
	fi


elif [[ "$choose_option" == "Settings " ]] ;then
	settings_option=$( \
	yad --title="Choose a Option " --width=600 --height=500 --separator="" --list --dclick-action="viewnior" \
	 --column="Please Pick a option"  "Sound" "Language" "Font" \
	"Color" "Your City" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center \
	 --fontname="$font_name $font_size");
	click;
	if [[ "$settings_option" == "Sound" ]] ; then
		sound=$(yad --title="Choose a Option " --width=600 --height=500\
		--separator="" --list --dclick-action="viewnior"\
	 	--column="Please Pick a option"  "on" "Off" \
	 	--window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
	 	--center --fontname="$font_name $font_size");
		echo "$sound"
		sed  1s/.*/$sound/ "$app_dir"/txt/setting.txt > $HOME/Myabell-1.0.0/txt/setting1.txt

	elif [[ "$settings_option" == "Language" ]] ; then
		language=$(yad --title="Choose a Option " --width=600 --height=500 \
		--separator="" --list --dclick-action="viewnior"\
	 	--column="Please Pick a option"  "English"  \
	 	--window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
	 	--center --fontname="$font_name $font_size");
		echo $language
		sed  2s/.*/$language/ "$app_dir"/txt/setting.txt > "$app_dir"/txt/setting1.txt

	elif [[ "$settings_option" == "Font" ]]; then
		font=$(yad --font --title="Pick Your Font" --width=600 --height=500 \
			separator="" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
		       --center --fontname="$font_name $font_size")
		#echo $font
		sed  3s/.*/"$font"/ "$app_dir"/txt/setting.txt > "$app_dir"/txt/setting1.txt

	elif [[ "$settings_option" == "Color" ]]; then
		color=$(yad --color --init-color=blue --title="Pick Your Color" --width=600 --height=500 \
		separator="" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
		--center --fontname="$font_name $font_size")
		echo $color
		sed  4s/.*/$color/ "$app_dir"/txt/setting.txt "$app_dir"/txt/setting1.txt

	elif [[ "$settings_option" == "Your City" ]] ; then
		value=$(yad --title="Select your city name to get weather" --form --separator="," \
		--field="City Name:" "London" \
		 --centre)
		 echo $value > "$app_dir"/txt/city.txt
	fi

	cat "$app_dir"/txt/setting1.txt > "$app_dir"/txt/setting.txt

elif [[ "$choose_option" == "About " ]] ;then
	yad --text-info < $HOME/Myabell-1.0.0/txt/about.txt --back=powderblue \
	--fore=blue --fontname="Monospace bold italic 20" \
	 --width=800 --height=600 --timeout=10 --no-buttons --title="My About" \
	  --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
	   --center --fontname="$font_name $font_size"
	click;

#File Converter
elif [[ "$choose_option" == "FileConversion " ]] ; then

	edit_type=$(yad --title="Choose File Editing Type" --width=600 \
	 --height=500 --separator="" --list --dclick-action="viewnior" --column="Choose Option" \
	"Media File Cut" "File Convert" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center \
	 --fontname="$font_name $font_size") #choosing conversion type
	click;

	if [[ $edit_type ==  "Media File Cut" ]] ; then
		$HOME/Myabell-1.0.0/shell_scripts/media_cut.sh
	else

	conversion_type=$(yad --title="Choose Conversion Type" --width=600\
	 --height=500 --separator="" --list --dclick-action="viewnior" --column="Conversion Type" \
	"Image Files to Video" "Other type" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center \
	 --fontname="$font_name $font_size") #choosing conversion type
	click;

	if [ "$conversion_type" == "Image Files to Video" ]; then
		in_im_dir=$(yad --width=600 --height=500 --file --directory \
		 --title="Select a directory which is containg images." \
		 --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
		  --center --fontname="$font_name $font_size") ; #image containing directory selection
		 click;


      		path_to_file_name "$in_im_dir";
      		in_dir="$file_name";
      		in_file_type="image";
		      out_file_type="video";
      		out_file_name="$in_dir""-output""$out_file_ext";
      		out_file_loc="$HOME/Myabell-1.0.0/Output/Video"
		#getting folder name of image containers
 		cd "$in_im_dir"; #going to the directory which containing the images
 		declare -i int=0; #just a integer for use
 		#Cheacking image folder and getting information of input images type
 		for i in *;
  			do
   				image_file_ext=${i:${#i}-4:${#i}};
   				image_file_name_start_3_words=${i:0:2};
   				#echo "Image File extn->$image_file_ext"
   				if [ $image_file_name_start_3_words != "pic" ]; then
    					if [ "$image_file_ext" == ".png" ]; then
     						cp "$i" "pic""$int"".png";
     						ext="png";
     						int=$((int+1)); #This loop changing image name with "pic"$int".png/jpg" for use

    					elif [ "$image_file_ext" == ".jpg" ]; then
     						cp "$i" "pic""$int"".jpg";
     						ext="jpg";
     						int=$((int+1));
     					else
     						continue
    					fi
   				fi
  			done
  		if [[ "$image_file_ext" == ".png" || "$image_file_ext" == ".jpg" || "$image_file_ext" == "jpeg" ]]; then
  			 out_file_ext=$(yad --title="Coose converted Output file extention :" --width=600 \
		 	--height=500 --separator=""\
      		 	--list --dclick-action="viewnior" --column="Extension" ".avi" ".flv" ".wmv" \
      		 	".mov" ".mp4" "h264" ".3gp"\
      		  	".gif" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
      		  	 --center --fontname="$font_name $font_size");
      			click;
  		else
  			yad --text-info < $HOME/Myabell-1.0.0/txt/no_image_error.txt\
 			 --back=gray --fore=powderblue --fontname="$font_name $font_size" \
 			--width=600 --height=500 --timeout="1" --no-buttons --title="Myabell-1.0.1" \
 			 --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center \
 			 --fontname="$font_name $font_size";

 		fi

       		 #png to mp4
  		if [[ $image_file_ext == ".png" ]] ; then
  			ffmpeg -r 10 -f image2 -s 1920x1080 -i "$in_im_dir/pic%01d.png" \
  			 "$out_file_loc/$in_dir-output.mp4" -y; #jpg to mp4 conversion
  		elif [[ $image_file_ext == ".jpg" ]]; then
  			ffmpeg -f image2 -i $in_im_dir/pic%01d.jpg  "$out_file_loc/$in_dir-output.mp4" -y;
  			#jpg to mp4 conversion
  		fi
		#converting
  		if [[ $out_file_ext == ".avi" ]]; then
  			ffmpeg -i "$out_file_loc/$in_dir-output.mp4" \
  			 -vcodec copy -acodec copy "$out_file_loc/${in_dir}-output.avi" -y #high quality converter
      			yad --file --filename="$out_file_loc/$in_dir-output-high.avi" --width=500;

      		 elif [[ $out_file_ext == ".mp4" ]]; then
			    yad --file --filename="$out_file_loc/$in_dir-output.3gp" --width=500

		  elif [[ $out_file_ext == ".flv" ]]; then
		 	    ffmpeg -i "$out_file_loc/$in_dir-output.mp4" "$out_file_loc/$in_dir-output.flv" -y
			    yad --file --filename="$out_file_loc/$in_dir-output.flv" --width=500

		  elif [[ $out_file_ext == ".wmv" ]]; then
		 	    ffmpeg -i "$out_file_loc/$in_dir-output.mp4" "$out_file_loc/$in_dir-output.wmv" -y
         		     yad --file --filename="$out_file_loc/$in_dir-output.wmv" --width=500

		  elif [[ $out_file_ext == ".mov" ]]; then
		 	    ffmpeg -i "$out_file_loc/$in_dir-output.mp4" "$out_file_loc/$in_dir-output.mov" -y
			    yad --file --filename="$out_file_loc/$in_dir-output.mov" --width=500

		  elif [[ $out_file_ext == "h264" ]]; then
		 	    ffmpeg -i "$out_file_loc/$in_dir-output.mp4" "$out_file_loc/$in_dir-output.h264" -y
			    yad --file --filename="$out_file_loc/$in_dir-output.h264" --width=500

		  elif [[ $out_file_ext == ".3gp" ]]; then
		 	    ffmpeg -i "$out_file_loc/$in_dir-output.mp4" "$out_file_loc/$in_dir-output.3gp" -y
			    yad --file --filename="$out_file_loc/$in_dir-output-low.3gp" --width=500

		  elif [[ $out_file_ext == ".gif" ]]; then
		 	    ffmpeg -i "$out_file_loc/$in_dir-output.mp4" "$out_file_loc/$in_dir-output.gif" -y
			    yad --file --filename="$out_file_loc/$in_dir-output.gif "--width=500
		 fi

		 #Removing new image files
		 #getting list of new created files
		 ls -t | head -"$int" > $HOME/Myabell-1.0.0/txt/new_image_files_list.txt
		 for j in  `cat $HOME/Myabell-1.0.0/txt/new_image_files_list.txt`
		 do
		 	rm  $j
		 done
		 
	elif [[ "$conversion_type" == " Images to pdf" ]]; then
		in_path=$(yad --width=600 --height=500 --file --title="Select a file to convert:" \
		  --file --directory \
		   --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center);
		  #input file selection other than image to video convert
		 path_to_file_name "$in_file_path";
		 in_file_name="$file_name";
		 file_ext_finder "$in_file_name";
		 in_file_ext="$file_ext";
		 file_type_check "$in_file_ext";
		 in_file_type="$file_type";
		 file_to_without_ext "$in_file_name";
		 in_file_name_without_ext="$file_name_without_ext";
		 in_file_loc="$in_file_path";
		 out_file_ext="pdf" 
		 out_file_type=$file_type;
      		out_dir="$HOME"/Myabell-1.0.0/Output/$out_file_type/; #Output directory location

	else
		  in_file_path=$(yad --width=600 --height=500 --file --title="Select a file to convert:" \
		   --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center);
		 #input file selection other than image to video convert
		 path_to_file_name "$in_file_path";
		 in_file_name="$file_name";
		 file_ext_finder "$in_file_name";
		 in_file_ext="$file_ext";
		 file_type_check "$in_file_ext";
		 in_file_type="$file_type";
		 file_to_without_ext "$in_file_name";
		 in_file_name_without_ext="$file_name_without_ext";
		 in_file_loc="$in_file_path";
		 out_file_type=$file_type;
      		 out_dir="$HOME"/Myabell-1.0.0/Output/$out_file_type/; #Output directory locatio
      		 convert "$in_file_path" "$HOME/Myabell-1.0.0/Document/$in_file_name.$out_file_ext"
echo "in_file-path=$in_file_path;in_file_name=$in_file_name;in_file_ext=$in_file_ext;in_file_type=$in_file_type;in-file-name_without_ext=$in_file_name_without_ext"
		 if [[ "$in_file_type" == "image" ]] ; then
 			out_file_ext=$(yad --title="Coose converted Output Image file Extension :" \
 			 --width=600 --height=500 --separator="" \
      			--list --dclick-action="viewnior" --column="Extension" \
      			"jpg" "png" "jpeg" "gif" "bmp" "tiff" "exif" "jpeg" "jpeg2000");
      			file_type_check --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center;
      			out_file_type=$file_type;
      			out_dir="$HOME"/Myabell-1.0.0/Output/$out_file_type/; #Output directory location

			convert "$in_file_path" "$HOME/Myabell-1.0.0/Document/$in_file_name.$out_file_ext"

  		elif [[ "$in_file_type" == "video" ]] ; then
  			out_file_type=$(yad --title="Choose converted Output file :" --width=600 --height=500 \
  			 --separator="" --list --dclick-action="viewnior" --column="Type"   "Video" "Audio" "Image" \
  			   --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center \
  			    --fontname="$font_name $font_size");

    			if [[ "$out_file_type" == "Video" ]]; then
      				out_file_ext=$(yad --title="Coose converted Output file :" --width=600 --height=500 \
      				 --separator=""\
      				 --list --dclick-action="viewnior" --column="Extension" ".avi" ".flv" \
      				  ".wmv" ".mov" ".mp4" "h264" ".3gp"\
      				  ".gif" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
      				   --center --fontname="$font_name $font_size");

      				 file_type_check "$out_file_ext";
      				 out_file_type="$file_type";
      				 out_file_name="$in_file_name$out_file_ext"
      				 file_to_without_ext "$in_file_name";
      				 in_file_name_without_ext="$file_name_without_ext"
      				 out_file_loc="$HOME/Myabell-1.0.0/Output/Video/"
      				 #echo "$in_file_name$out_file_ext"
      				 ffmpeg -i "$in_file_path" "$out_file_loc$in_file_name_without_ext$out_file_ext" -y
      				# out_dir="$HOME"/Myabell-1.0.0/output/$out_file_type"; #output directory location
      				#ffmpeg -y -i "$in_file_loc"/"$in_file" -vf "setpts=1.25*PTS" -r "$out_dir"/"$out_file"
      				  #Video to Video Conversion

      			elif [[ "$out_file_type" == "Audio" ]]; then
      				out_file_ext=$(yad --title="Coose converted Output file :" --width=600 \
      				 --height=500 --separator="" --list\
      			 	--dclick-action="viewnior" --column="Extension" ".mp3" ".3gp" "aiff" \
      			 	 ".aac" ".m4p" ".ogg" ".opus" ".wav" \
      			 	"webm"  --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
      			 	 --center --fontname="$font_name $font_size");

      				 file_type_check "$out_file_ext";
      				 out_file_type="$file_type";
      				 out_file_name="$in_file_name_without_ext$out_file_ext";
      				 out_file_loc="$HOME/Myabell-1.0.0/Output/Audio/"
				 #ffmpeg -i "$in_file_loc"/"$in_file" "$out_dir"/"$out_file" #Video to Audio Conversion
				ffmpeg -i "$in_file_path" "$out_file_loc/$in_file_name.$out_file_ext" -y

       			elif [[ "$out_file_type" == "Image" ]]; then
      				out_file_ext=$(yad --title="Coose converted Output file :" \
      				 --width=600 --height=500 --separator="" \
      			 	--list --dclick-action="viewnior" --column="Extension" ".jpg" \
      			 	 ".png" ".jpeg" ".gif" ".bmp" ".tiff" ".exif" \
      			 	 "jpeg 2000"  --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
      			 	  --center --fontname="$font_name $font_size");

      			 	 file_type_check "$out_file_ext";
      				 out_file_type="$file_type";
      				 out_file_name="$in_file_name_without_ext$out_file_ext";
      				 out_file_loc="$HOME/Myabell-1.0.0/Output/Image/$output_file_type";
      				 #echo -e "\e[33m$in_file_path" "$out_file_loc$in_file_name_without_ext$out_file_ext\e[0m"
				ffmpeg -i "$in_file_path" -vf fps=1"$out_file_loc$in_file_name_without_ext$out_file_ext" -y;
      			fi

      		elif [[ "$in_file_type" == "document" ]] ; then
      			out_file_ext=$(yad --title="Coose converted Output file :" --width=600\
      			 --height=500 --separator=""\
      			 	--list --dclick-action="viewnior" --column="Extension" "pdf" \
      			 	"txt" "png" "html" "doc" "docx" "md" \
      			 	  --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
      			 	   --center --fontname="$font_name $font_size");

      			 file_type_check "$out_file_ext";
      			 out_file_type="$file_type";
      			 out_file_name="$in_file_name_without_ext$out_file_ext";
      			 out_file_loc="$HOME/Myabell-1.0.0/Output/Document/$output_file_type"

      			 if [[ $in_file_ext == "png" && $out_file_ext == "pdf" ]]; then
      			 	convert "$in_file_path" "$out_file_loc/$in_file_name_without_ext$out_file_ext";
      			 fi

      			  if [[ $in_file_ext == "pdf" && $out_file_ext == "png" ]]; then
      			 	convert "$in_file_path" "$out_file_loc/$in_file_name_without_ext$out_file_ext";
      			 fi

      			  if [[ $in_file_ext == "txt" && $out_file_ext == "pdf" ]]; then
      			 	enscript -p file.ps "$in_file_path"
				ps2pdf file.ps "$out_file_loc/$in_file_name_without_ext$out_file_ext"
      			 fi

      			 if [[ $in_file_ext == "doc" && $out_file_ext == "pdf" ]]; then
      			 	oowriter -pt pdf "$in_file_path";
      			 fi

      		elif [[ "$in_file_type" == "audio" ]]; then
      			out_file_ext=$(yad --title="Coose converted Output file :" \
      			--width=600 --height=500 --separator=""\
      			 --list --dclick-action="viewnior" --column="Extension" "mp3" "3gp" \
      			 "aiff" "aac" "m4p" "ogg" "opus"    "wav" "webm" \
      			  --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png \
      			  --center --fontname="$font_name $font_size");
      			file_type_check "$out_file_ext";
      			out_file_type="$file_type";
      			out_file_name="$in_file_name_without_ext$out_file_ext";
      			out_file_loc="$HOME/Myabell-1.0.0/Output/Audio/$output_file_type"
      			ffmpeg -i "$in_file_path" -acodec pcm_s16le -ac 1 -ar 16000 \
      			"$out_file_loc/$in_file_name.$out_file_ext" -y;

      		elif [[ "$in_file_type" == "invalid" ]] ; then
 			out_file_ext="invalid"
 			touch invalid_file_selection.txt;
 			echo -e \
 			"\t\tMyabell-1.0.0\n\n\t\t\t✖️\n\n\tSorry!\n\tYou Select wrong file.\n\tTry again Later.\n\tI can not  do such kind conversion!" >\
 			 $HOME/Myabell-1.0.0/txt/invalid_file_select.txt;

 			yad --text-info < $HOME/Myabell-1.0.0/txt/invalid_file_select.txt\
 			 --back=gray --fore=powderblue --fontname="$font_name $font_size" \
 			--width=600 --height=500 --timeout="1" --no-buttons --title="Myabell-1.0.1" \
 			--window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center --fontname= \
 			"$font_name $font_size";
 			click;
 			file_type_check $out_file_ext;
      			out_file_type="$file_type";
      			out_file_name="$in_file_name_without_ext$out_file_ext";
      			out_file_loc="$in_file_loc";
 		else
 			yad --text-info < $HOME/Myabell-1.0.0/txt/invalid_file_select.txt \
 			 --back=gray --fore=powderblue --fontname="$font_name $font_size" \
 			--width=600 --height=500 --timeout="1" --no-buttons --title="Myabell-1.0.1" --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center \
 			 --fontname="$font_name $font_size";
 			click;
 		fi
	fi
	fi
fi
