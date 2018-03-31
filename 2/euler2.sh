#!/bin/bash
l=$1
r=$2
temp=$r
sum=0
[ $((l%2)) -eq 0 ] && (( sum+=$l ))
[ $((r%2)) -eq 0 ] && (( sum+=$r ))

while [ $((r=$r+$l)) -lt 4000000 ]
do
    [ $((r%2)) -eq 0 ] && (( sum+=$r ))
	l=$temp
	temp=$r
done
echo $sum

