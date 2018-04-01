#!/bin/bash
n=2000000

for (( i = 2; i < n; i++ )); do
	array[i]=1
done

sqrt_n=$(echo "sqrt( $n )" | bc -l)
for (( i = 2; $( echo "$i < $sqrt_n" | bc ) ; i++ )); do
	if [[ ${array[i]} -eq 1 ]]; then
		j=0
		calc=$(((i**2)+j*i))
		while [[ calc -lt n ]]; do
			array[calc]=0
			((j++))
			calc=$(((i**2)+j*i))
		done
	fi
done

sum=0
for (( i = 0; i < n; i++ )); do
	[[ ${array[i]} -eq 1 ]] && ((sum+=i))
done
echo result: $sum