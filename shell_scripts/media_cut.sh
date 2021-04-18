#!/bin/bash
#This is the video or mp3 cuter

choose_option=$( yad --title="Media File Cutter " --width=600 --height=500 \
	 --separator="" --list --dclick-action="viewnior" \
	 --column="Please pick a option" "Audio" "Video" \
	  --center\
	    --fontname="Monospace 20");
if [[ $choose_option == "Audio" ]]; then
	file_path=$(yad --width=600 --height=400 --file --file-filter "Audio File | *.mp3 *.3gp *.aiff *.aac *.m4p *.ogg *.opus *.wav  *.webm") 
else
	file_path=$( yad --width=600 --height=400 --file --file-filter "Video File | *.avi *.flv *.wmv *.mov *.mp4 *.h264 *.3gp *.gif")
fi

#Getting full playing time
duration=$(exiftool -S -n "$file_path" | grep ^Duration)
echo $duration
IFS=': ' read -r -a array <<< "$duration"
second0=${array[1]}
second=$(printf "%.*f\n" 0 "$second0") #Roundoff the seconds
echo "$second"

sec=$(echo "$second%60" | bc)
min=$(echo "(($second-$sec)/60)%60" | bc)
hour=$(echo "(($second-$sec)/60-$min)/60" | bc)

echo "Seconds:$sec;Miutes:$min;Hour:$hour"


file_name=$(basename $file_path)

value=$(yad --title="Fill the following to manipulate selected file." --form --separator="," \
--field="File Name:" "$file_name" \
--field="Starting Hour:NUM" 0\!0..$hour\!1 \
--field="Starting Minute:NUM" 0\!0..$min\!1 \
--field="Starting Second:NUM" 0\!0..$sec\!1 \
--field="Stop Hour:NUM" 0\!0..$hour\!1 \
--field="Stop Minute:NUM" 0\!0..$min\!1 \
--field="Stop Second:NUM" 0\!0..$sec\!1  --centre)

#
IFS=',' read -ra val <<< "$value"

s_hour=${val[1]}
s_minute=${val[2]}
s_second=${val[3]}
stp_hour=${val[4]}
stp_minute=${val[5]}
stp_second=${val[6]}


echo "$s_hour,$s_minute,$s_second,$stp_hour,$stp_minute,$stp_second"
if [[ $choose_option == "Audio" ]]; then
	ffmpeg -i "$file_path" -ss "$s_hour":"$s_minute":"$s_second" -t "$stp_hour":"$stp_minute":"$stp_second" -acodec copy -vcodec copy -async 1 "$HOME/Myabell-1.0.0/Output/Audio/output-$file_name"
elif [[ $choose_option == "Video" ]]; then
	ffmpeg -i "$file_path" -ss "$s_hour":"$s_minute":"$s_second" -t "$stp_hour":"$stp_minute":"$stp_second" -acodec copy -vcodec copy -async 1 "$HOME/Myabell-1.0.0/Output/Video/output-$file_name"
fi

