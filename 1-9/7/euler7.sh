#!/bin/bash
prime_count=1 #2
i=1
while [ $prime_count -lt 10001 ]; do
	count=0
	((i+=2))
	num=$i
	for (( j=3; j*j<=i; j+=2 )); do
		while [ $((num%$j)) -eq 0 ] && [ $count -lt 1 ]; do
			num=$((num/$j))
			((count++))
		done
	done
	[ $count -lt 1 ] && ((prime_count++))
done
echo result: $i
