#!/bin/bash
#slow method
i=3
sum=2
prime=()
while [ $i -lt 2000000 ]; do
	count=0
	j=0
	border=0
	while [[ $i -gt border && j -lt ${#prime[@]} ]] ; do
		div=${prime[j]}
		[ $((i%div)) -eq 0 ] &&	((count++)) && break
		((j++))
		border=$((div*div))
	done
	[ $count -lt 1 ] && ((sum+=i)) && prime+=($i)
	((i+=2))
	[ $((i%1001)) -eq 0 ] && echo progress $i / 2000000
done
echo result: $sum
