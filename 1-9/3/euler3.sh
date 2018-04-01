#!/bin/bash
biggest_factor=0
d=2
n=$1

while [ $n -gt 1 ]
do
	while [ $((n % d)) -eq 0 ]
	do
		echo $d
		[ $d -gt $biggest_factor ] && biggest_factor=$d 
		(( n/=d ))
	done
	(( d+=1 ))
done
echo "the largest number is: $biggest_factor"
