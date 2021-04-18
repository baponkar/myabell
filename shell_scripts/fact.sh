#! /bin/bash
#Finding the factprial of 

read -p "Please enter a number to find factoria : " x;



res=1;
i=$x;
while [ $i -ge 1 ]
do
  res=$[ $res*$i ]
  let i--
done

echo "$x! = $res"


