#!/bin/bash -x
STAKE=100
STAKE_START=1
echo "Enter n of trials"
read n
goal=100
bets=0
wins=0
for (( i=0; i<n; i++ ))
do
        cash=$STAKE_START
	while [ $cash -gt 0 ] && [ $cash -lt  $goal ] 
        do
		((bets++))
		random=$((RANDOM%2))
		if [  $random -lt  1 ]
		then 
                      ((cash++))
		else
     		      ((cash--))
		fi
	done

       	if [ $cash -eq $goal ]
 	then
		((wins++))
        else
                ((loose++))
   	fi
done
echo  $wins   "   " $n
percent=$(( 100 * $wins / $n ))
echo "Percent of games won" $percent
percent1=$(( 100 * $loose / $n ))
echo "Percent of games loose" $percent1

if [ $percent -ge 50 ]
then
     echo "Resign for the day"
elif [ $percent1 -ge  50 ]
then
     echo "Resign for th day"
fi
