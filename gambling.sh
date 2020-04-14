#!/bin/bash -x
STAKE=100
STAKE_START=1
echo "Enter n of trials"
read n
goal=100
bets=0
wins=0
loose=0
count=0
amount=0
for (( i=0; i<n; i++ ))
do
        cash=$STAKE_START
        while [ $count -ne  30 ]
        do
		while [ $cash -gt 0 ] && [ $cash -lt  $goal ]  
       		do
			((bets++))
			random=$((RANDOM%2))
			if [ $random -le  1 ]
			then 
                      		((cash++))
			else	
     		      		((cash--))
			fi 
                done
                amount=$(( $cash + $amount ))
        	((count++))
        done
                if [ $cash -eq $goal ]
   	        then
               	        ((wins++))
        	else
               		((loose++)) 	
   	 	fi
done

echo  $wins  " " $n 
echo  $loose

diff=$(( $wins - $loose ))

percent=$(( $wins / $n * 100 ))
 
if [ $percent -ge 50 ]
then
     echo "Continue Playing"
elif [ $percent -le  50 ]
then
     echo "Resign for the day"
fi

