#!/bin/bash

echo "This is File identifier script";

file_loc=$1;

#Declaring some files extension list
img_ext_list="jpg png jpeg gif bmp tiff exif jpeg jpeg2000"; #Image file extension list
vid_ext_list="avi flv wmv mov mp4 h264 3gp gif"; #Video file extension list
aud_ext_list="mp3 3gp aiff aac m4p ogg opus wav webm" #Audio file extension list
doc_ext_list="pdf txt png html doc docx md" ; #Document file extension list


#checking input file type
file_type_list="image video audio document";

#file_name="test.jpeg";
#file_name_wout_ext="";
#file_type="";

location_to_file_name(){
	declare -i int0=0;
	declare -i len=0;
	file_loc_split=$(echo $file_loc | tr "/" "\t");
	file_dir=""

	for i in $file_loc_split;
		do
			len=$((len+1));
		done
	for j in $file_loc_split;
		do
			int0=$((int0+1));
			if [[ "$int0" -le "$((len-1))" ]]; then
 				file_dir="$file_dir"/"$j"
			elif [[ "$int0" == "$len" ]]; then
				file_name="$j";
			else
				continue;
			fi
		done
		

}

file_ext_finder(){
	file_name="$1"
	declare -i int=0;
	file_name_split=$(echo $file_name | tr "." "\t");
	for i in $file_name_split;
		do
			if [[ "$int" == "0" ]]; then
				file_name_wout_ext=$i;
				int=$((int+1));
			elif [[ "$int" == "1" ]]; then
				file_ext=$i
			else
				continue
			fi
		done

}


file_type_check(){
		extension=$1;
		file_type="";
		
	        img_ext_list="jpg png jpeg gif bmp tiff exif jpeg jpeg2000"; #Image file extension list
		vid_ext_list="avi flv wmv mov mp4 h264 3gp gif"; #Video file extension list
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

}

location_to_file_name;
file_ext_finder $file_name;
file_type_check "$file_ext";

export file_name;
export file_ext;
export file_type;
echo "File Name : $file_name , File Type : $file_type , File Extention : $file_ext " ;
echo $file_dir

