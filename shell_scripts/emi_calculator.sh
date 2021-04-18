#Offline EMI Calculator

value=$(yad --title="Fill the following to manipulate selected file." --form --separator="," --field="Principle:NUM" "0\!0..10000000" --field="Rate of Interest per annum:NUM" 0\!0..100\!1!1 --field="Tenure in months:NUM" 0\!0..1200\!1 --width=600 --height=500  --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center --fontname="$font_name $font_size" --center)

IFS=',' read -ra val <<< "$value"

P=${val[0]}
R=${val[1]}
T=${val[2]}
#echo "P:$P,R:$R,T:$T"
emi=$(echo "( ( $P * $R/1200 ) * (  ( 1 + $R/1200)^$T ) )  / (  ( (1+$R/1200 )^$T ) - 1  )" | bc -l )

total_paid=$(echo "$emi*$T" | bc -l)
total_interest=$(echo "$total_paid-$P" | bc -l)
echo -e "\n\n\t\t\tPrinciple : $P\n\n\t\t\tRate of Interest per annum : $R\n\n\t\t\tTenure  in Months : $T\n\n\t\t\tEMI : $emi\n\n\t\tTotal Interest : $total_interest\n\n\t\tTotal Payable : $total_paid" > $HOME/Myabell-1.0.0/txt/emi.txt

yad --text-info < $HOME/Myabell-1.0.0/txt/emi.txt \
 			 --back=gray --fore=powderblue --fontname="$font_name $font_size" \
 			--width=600 --height=500 --no-buttons --title="Caluculated EMI" \
 			 --window-icon=$HOME/Myabell-1.0.0/Icons/Myabell_logo64.png --center \
 			 --fontname="$font_name $font_size" --center;
 			 
