found=0
num=0 #number in the row
i=1 #counter to increase the row
find_more=500

while [[ found -eq 0 ]]; do
	((num+=i))
	((i++))
	div_n=2 #1 and the number itself
	div=2
	max=$num
	while [[ div -lt max ]]; do
		if (( num % div == 0 )); then
			((div_n++))
			max=$((num / div))
			if (( max != div )); then
				((div_n++))
			fi
		fi
		((div++))
	done
	[ $div_n -gt $find_more ] && found=1
done
echo result: $num