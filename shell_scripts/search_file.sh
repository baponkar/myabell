#!/bin/bash

#checking function 
#This script finding a file exists or not in specified directory
location=$1
file_name=$2






function check() {


#cd $location


 if [ -e $location/$file_name ]
 then
 
   echo -e "\n\e[1;32m\tThe file '$file_name' exists in $location\n\e[0m"

   if [ -f $location/$file_name ]
   then
    echo -e "\e[32m\t\tThis is a file\n\e[0m"
   elif [ -d $location/$file_name ]
   then
    echo -e "\e[32m\t\tThis is a directory\n\e[0m"
   else
    echo -e "\t\e[1;32m This is a link\n\e[0m"
   fi
 else
   #making a temporary file to contain the reslt of ls
   touch ls.txt
   ls>ls.txt

   #now looking inside of directory whice are containing by the supplied searching directory
   while read line;
   
   do
    if [ -d $line ]
    then
     location=$location/$line
     #cd $location
     check
     fi
    done < ls.txt
   fi
    
}

check
