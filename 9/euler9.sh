#!/bin/bash
b=0
while [ $b -lt 500 ]; do
	a=$((b-1))
	while [ $a -gt 0 ]; do
		((c_pow=a**2+b**2))
		c=$(echo "sqrt( $c_pow )" | bc -l )
		[ $( echo "$a+$b+$c == 1000" | bc ) -eq 1 ] && echo result: $( echo "$a*$b*$c" | bc ) && exit 1
		((a--))
	done
	((b++))
done