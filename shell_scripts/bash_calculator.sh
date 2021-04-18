#!/bin/bash

#Bash Calculator version 2.0.0


#simple calculator😁



#trignometry
sin ()
{
    echo "Sin($x)=$(echo "scale=5;s($x)" | bc -l)"
}

cos ()
{
    echo "Cos($x)=$(echo "scale=5;c($x)" | bc -l)"
}

tan ()
{
    echo "Tan($x)=$(echo "scale=5;s($x)/c($x)" | bc -l)"
}

cosine ()
{
    echo "Cosine($x)=$(echo "scale=5;1/s($x)" | bc -l)"
}

sec ()
{
    echo "Sec($x)=$(echo "scale=5;1/c($1)" | bc -l)"
}

cot ()
{
    echo "Cot($x)=$(echo "scale=5;c($x)/s($x)" | bc -l)"
}

asin ()
{
    if (( $(echo "$x == 1" | bc -l) ));then
       echo "90"   
    elif (( $(echo "$x < 1" | bc -l) ));then
       echo "scale=3;a(sqrt((1/(1-($x^2)))-1))" | bc -l
    elif (( $(echo "$x > 1" | bc -l) ));then
       echo "error"
    fi
}

acos ()
{
    if (( $(echo "$x == 0" | bc -l) ));then
       echo "90"
    elif (( $(echo "$x <= 1" | bc -l) ));then
       echo "scale=3;a(sqrt((1/($x^2))-1))" | bc -l
    elif (( $(echo "$x > 1" | bc -l) ));then
       echo "error"
    fi
}

atan ()
{
    echo "scale=3;a($x)" | bc -l
}

acot ()
{
    echo "scale=5;a(1/$x)" | bc -l
}

asec ()
{
    echo "scale=5;a(sqrt(($x^2)-1))" | bc -l
}

acosine ()
{
    echo "scale=5;a(1/(sqrt($x^2)-1))" | bc -l
}

#-------------------------------------------------------------------------------------------------------------------------------------------------



clear

echo -e " \e[1;31m                   [[  👉 My Calculator!, Version-2.0.0 👈 ]] \e[0m "


while [ 1  ]
	
do
echo -e "---------------------------------------------------------------------------------------"
echo -e "\e[1;34m                   TO Exit Type 'q' Or Press CTRL+C and enter\e[0m"
echo -e "\e[1;36m ________________________________________________________\e[0m"
echo -e "\e[1;36m Your's Option:| Algebric | Trigonometric | \e[0m"

read -p "Option: " op1
if [[ $op1 = 'q' || $op1 = 'Q' ]]
then
break
elif [[ ( ( $op1 = 'A' || $op1 = 'a' ) || ( $op1 = 'Algebric' || $op1 = 'algebric' ) ) || $op1 = 'algeb' ]]
then 
  clear
  echo -e "Algebric Option"
  echo -e "\e[1;36m |Enter a operation: root | + | - | / | x | ^ | rem | % |\e[0m"
  echo -e "\e[1;34m --------------------------------------------------------\e[0m"
  echo -e " \e[1;3;5;31m >>> \e[0m"
  read -p  "Option:" op
  if [ $op = 'q' ]
then
	break
elif [ $op = 'root' ]
then
	read -p "Enter a number:" x
	echo -e " \e[1;33m  sqrt($x)=$(echo "sqrt(9)" | bc) \e[0m"
else
read -p " Enter first number: " v1

read -p " Enter second number: " v2
if   [ $op = '+' ]
then
	echo -e " \e[1;33m #$v1+$v2=$(echo "scale=5;$v1 + $v2 " | bc) \e[0m"
elif [ $op = '-' ]
then
	echo -e "\e[1;33m #$v1-$v2=$(echo "scale=5;$v1 - $v2" | bc) \e[0m"
elif [ $op = 'x' ]
then
	echo -e "\e[1;33m #$v1 X $v2=$(echo "scale=5;$v1 * $v2" | bc) \e[0m"
elif [ $op = '/' ] 
then
	echo -e "\e[1;33m #$v1/$v2=$(echo " scale=5;$v1 / $v2 " | bc) \e[0m"
elif [ $op = '^' ]
then
	echo -e "\e[1;33m #$v1^$v2=$(echo "scale=5;$v1 ^ $v2  " | bc) \e[0m"
elif [ $op = 'rem' ]
then
	echo -e "\e[1;33m #remainder:$(echo "scale=5;$v1 % $v2 " | bc)\e[0m"
elif [ $op = '%' ] 
then
	a=$(echo "scale=2;( $v1 * 100 ) / $v2 " | bc)
	echo -e "\e[1;33m #$v1 is $a% of $v2 \e[0m"
else
       echo -e " \e[1;31m #Invalid option! \e[0m "
fi
fi


elif [[ $op1 = 'T' || $op1 = 't' || $op1 = 'trigonometric' || $op1 = 'Trigonometric' ]]
echo "Trigonometric"
then
  clear
  echo -e "\e[1;36m |Enter a operation: | sin | cos | tan | cosine | sec | cot | asin | acos | atan | acosine | asec | acot | \e[0m"
  echo -e "\e[1;34m --------------------------------------------------------------------------------------------------------\e[0m"
  echo -e " \e[1;3;5;31m >>> \e[0m"
  read -p  "Option:" op
  read -p "Angle: " z
  read -p "degre or radian: " u
  
   if [[ $u = 'degre' || $u = 'd' || $u = 'deg' || $u = 'degree' || $u = 'D' || $u = 'Degre' ]]
   then
    pi=3.14159
    t=$(echo "scale=5;$z * $pi" | bc )
    t1=$(echo "scale=5;$t / 180.0" | bc )
    x=$t1
    echo "angle:$x radiun"
   elif [[ $u = 'r' || $u = 'R' || $u = 'rad' || $u = 'Rad' || $u = 'radian' || $u = 'Radian' ]]
   then
    echo "Angle:$z radiun"
   else
    echo "No unit for angle"
   fi

   if [[ $op = 'sin' ]]
   then
    sin
   elif [[ $op = 'cos' ]]
   then
    cos
   elif [[ $op = 'tan' ]]
   then
    tan
   elif [[ $op = 'cosine' ]]
   then
    cosine
   elif [[ $op = 'sec' ]]
   then
    sec
   elif [[ $op = 'cot' ]]
   then
    cot;
   else
     read -p "Enter the value: " x
     if [[ $op = 'asin' ]]
     then
       asin
     elif [[ $op = 'acos' ]]
     then
       acos
     elif [[ $op = 'atan' ]]
     then
       atan
     elif [[ $op = 'acosine' ]]
     then
       acosine
     elif [[ $op = 'asec' ]]
     then
     asec
     elif [[ $op = 'acot' ]]
     then
     acot
     else
      echo "Sorry!Wrong Option."
     fi
   fi 
    
  
 

else 
echo -e "\e[1;31m You typed Wrong Option!!!!! \e[0m"
fi
done





