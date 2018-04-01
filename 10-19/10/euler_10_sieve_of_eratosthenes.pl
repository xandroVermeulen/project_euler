$n = 2000000;
@array=();

for my $i (2..$n){
	$array[$i] = 1;}

for($i = 2; $i < sqrt($n); $i++){
	if($array[$i]){
		for($j = 0; ( ($i**2)+$j*$i )< $n; $j++){
			$array[($i**2)+$j*$i] = 0;	
		}
	}}
$sum=0;
for($i = 0; $i < $#array; $i++) {
	if($array[$i]){
		$sum+=$i;
	}
}
print "solution: $sum\n";

