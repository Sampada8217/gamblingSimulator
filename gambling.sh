#!/bin/bash -x
STAKE_EVERYDAY=100
STAKE_START=1
echo "Enter n of trials"
read n
goal=1
bets=0
wins=0

random=$((RANDOM%2))
if [  $random -le  0 ]
then
     echo "Win  $1"
else
     echo "Loose $1"
fi
	

