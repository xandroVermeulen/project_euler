#!/bin/bash
array=()
for (( i = 9; i < 20; i++ )); do
	fac=()	

	#calculate the factors of the current number
	num=$i
	for (( j=2; j<=$i; j++ )); do
		while [ $((num%$j)) -eq 0 ]; do
			num=$((num/$j))
			fac+=($j)
		done
	done
	echo i: $i fac: ${fac[@]}

	#for every different factor we check whether the array contains enough of it
	fac_i=0
	while [ $fac_i -lt ${#fac[@]} ]; do

		value=${fac[fac_i]}
		n_it=$(
		for num in ${fac[@]}; do
			echo $num
		done | grep -c $value)

		n_array=$(
		for num in ${array[@]}; do
			echo $num
		done | grep -c $value)


		(( difference=n_it-n_array ))
		if [ $difference -gt 0 ] ; then
			for (( k=0; k<$difference; k++ )); do
				array+=($value)
			done
		fi

		while [ $fac_i -lt ${#fac[@]} ] && [ ${fac[fac_i]} -eq $value ]; do
			((fac_i++))
		done
	done
done

echo array: ${array[@]}
result=1
for num in ${array[@]}; do
	(( result *= num ))
done
echo result $result