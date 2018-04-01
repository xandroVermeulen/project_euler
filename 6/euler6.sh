#!/bin/bash
sum=0
pow_sum=0
for i in {1..100}; do
	((sum+=i))
	((pow_sum+=i**2))
done
((sum=sum**2))
echo $((sum - pow_sum))