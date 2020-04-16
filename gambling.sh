#!/bin/bash -x
STAKE=100
STAKE_START=1
GOAL=100
function gambling()
{
echo "Enter n of trials"
read n
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
		while [ $cash -gt 0 ] && [ $cash -lt  $GOAL ]    #cash should be less than 100 which is goal for a day  
       		do
			((bets++))
			random=$((RANDOM%2))
			if [ $random -le  1 ]
			then 
                      		((cash++))
			else	
     		      		((cash--))
			fi 
                        if [ $cash -eq $GOAL ]
                        then
                            ((wins++))
                        else
                            ((loose++))
                        fi
                done
                amount=$(( $cash + $amount ))
        	((count++))
        
                wins=$wins
                loose=$loose 
                
       done
done
#Total amount of won and lost
echo  $wins  " " $n 
echo  $loose
#by how much loose or win
diff=$(( $wins - $loose ))
#percent of wins
percent=$(( $wins / $n * 100 ))
#if win is greater than 50 for a month continue else stop playing
if [ $percent -ge 50 ]
then
     echo "Continue Playing"
elif [ $percent -le  50 ]
then
     echo "Resign for the day"
fi
}
gamblingGame="$( gambling )" 
