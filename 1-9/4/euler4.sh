#!/bin/bash
biggest=0
for i in {999..100}
do
	for((j=999; j>=$i; j--))
	do
		result=$(( i*j ))
		reverse=$(rev<<<$result)
		[ $result -eq $reverse ] && [ $result -gt $biggest ] && biggest=$result
	done
done
echo $biggest