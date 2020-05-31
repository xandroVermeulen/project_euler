my $possible = 1;
my $max_value=0;
while($possible){
	$max_value = $max_value*10+9;
	$possible = !(sum_factor_five($max_value) < $max_value)	;
}

my $solution = 0;
for my $i (2..$max_value){
	if(sum_factor_five($i) == $i){
		$solution += $i;
	}
}
print "solution: ", $solution,"\n";


sub sum_factor_five{
	$number = shift;
	my @digits =$number =~ /./g;
	my $result=0;
	$result += $_**5 foreach(@digits);
	return $result;
}