#!/bin/bash

input_file=$1
output_file=$2

source ./file_identifier.sh

file_ext_finder $input_file
input_file_name=$file_name_wout_ext;
input_file_ext=$file_ext
file_type_check $input_file_ext
input_file_type=$file_type

file_ext_finder $output_file
output_file_name=$file_name_wout_ext;
output_file_ext=$file_ext
file_type_check $output_file_ext
output_file_type=$file_type

echo "$input_file_name,$input_file_ext,$input_file_type"
echo "$output_file_name,$output_file_ext,$output_file_type"


convert_possibility=false;

if [[ $input_file_type == "image" && $output_file_type == "image" ]]; then
	convert_possibility=true;
elif [[ $input_file_type == "image" && $output_file_type == "video" ]]; then
	convert_possibility=true;
elif [[ $input_file_type == "image" && $output_file_type == "document" ]]; then
	convert_possibility=true;
elif [[ $input_file_type == "video" && $output_file_type == "video" ]]; then
	convert_possibility=true;
elif [[ $input_file_type == "video" && $output_file_type == "image" ]]; then
	convert_possibility=true;
elif [[ $input_file_type == "document" && $output_file_type == "document" ]]; then
	convert_possibility=true;
elif [[ $input_file_type == "document" && $output_file_type == "image" ]]; then
	convert_possibility=true;
else
	convert_possibility=false;
fi



