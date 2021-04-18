#by using bluez-tools
#Install : sudo apt-get install bluez-tools

bt-device -l > device_list.txt 					#showing paired devices list
#cat device_list.txt
total_lines=$(grep -c $ device_list.txt) 				#total lines in the text file

#echo $total_lines
#dev=$(echo "$dev_list" | tr "\n" "\t") 
device_name="" 							# storing devices name on device_name list 
device_id="" 							# storing devices id on device_id list

name_array=();
ad_array=()

declare -i int=1;
for i in $(seq 2 $total_lines);
	do
		int=$((int+1)); 					#increase counter integer
		line=$(head -n $int device_list.txt | tail -1); 	#taking line string and storing into line variable
		#echo "Line :$int ->$line";
		devicename=${line%(*} 				#cutting string previous value of (
		device_name="$device_name\t$devicename"
		name_array+=("$devicename")
		
		
		#echo "$devicename$int"
		device=${line##*'('}       				#Cutting string after from (
		devicead=${device%')'*} 				#removing ')' from string
		device_id="$device_id\t$devicead"
		#echo "$devicead$int"
		ad_array+=("$devicead")	
	done
#echo "-----------------------------------"	
#echo ${name_array[0]}
#echo ${ad_array[0]}
#echo "-----------------------------------"	

array_length="${#name_array[@]}"

for i in $(seq 0 $array_length);
	do
		echo " $i : ${name_array[$i]}"
	done
	

	

#echo -e "\n\n\n"	
#echo -e "Device Name : $device_name"
#echo -e "\n\n\n"
#echo -e "Device ID : $device_id"


read -p "Select your device no : " x

select_device="${ad_array[$x]}"

echo -e "\e[32m MAC ADDRESS : $select_device \e[0m"

#blueman-sendto -- device="$select_device" '/home/uniteworld/Desktop/bash/bluetooth_control.sh'


