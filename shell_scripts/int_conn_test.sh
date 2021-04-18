#!/bin/bash

wget -q --spider http://google.com  # -q silence mode; --spider do'nt get, just check page availiability
#Else you can use : echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo "Online"
else
	echo "Offline";
fi
