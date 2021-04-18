#Install Packages

#sudo apt-get install curl jq

#Checking network connection
#!/bin/bash

wget -q --spider http://google.com  # -q silence mode; --spider do'nt get, just check page availiability
#Else you can use : echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1

if [[ $? == 0 ]]; then

	#Find local ip	
	hostname --ip-address > ip.txt; #getting all hostname address
	awk -F: '{print $15}' ip.txt > ip1.txt; #picking the string containing by local ip separeted by : and storing into ip.txt file
	ad=`awk -F" " '{print $2}' ip1.txt` #extract local ip and storing into ip1.txt
	rm ip.txt #deleting ip.txt
	rm ip1.txt #removing ip1.txt
	#echo "$ad" #printing ip address




	#find the server public address

	my_ip=$(curl https://ipinfo.io/ip)

	#get location data from api

	#curl https://ipvigilante.com/<your ip address>
	curl https://ipvigilante.com/$my_ip > result.txt


	status=$(jq '.status' result.txt)
	jq '.data' result.txt > result1.txt

	ipv4=$(jq '.ipv4' result1.txt)
	continent=$(jq '.continent_name' result1.txt)
	country=$(jq '.country_name' result1.txt)
	subdivision1=$(jq '.subdivision_1_name' result1.txt)
	subdivision2=$(jq '.subdivision_2_name' result1.txt)
	city=$(jq '.city_name' result1.txt)
	latitude=$(jq '.latitude' result1.txt)
	longitude=$(jq '.longitude' result1.txt)

	my_info="Local IP :: $ad \nPublic IP :: $ipv4\nContinent :: $continent\nCountry :: $country\nSubdivision1 :: $subdivision1\nSubdivision2 :: $subdivision2\nCity :: $city\nLatitude :: $latitude\nLongitude :: $longitude"

	echo -e $my_info 

else
	echo "You areOffline"
fi
