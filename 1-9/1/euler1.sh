#!/bin/bash
sum=0
for i in {1..999}
do
	if(( (i % $1 == 0) || (i % $2 == 0)))
	then
    	((sum+=i))
	fi
done
echo $sum
