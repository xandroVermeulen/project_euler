my @b_values = sieve_of_eratosthenes(1000);#when n=0 and a=0 it needs to be prime
my $biggest_n = 0;
my $solution_a, $solution_b;

for my $b  (@b_values) {
	for(my $a=-999; $a<1000; $a+=2){#primes need to be odd
		$n=0;
		while(is_prime($n**2 + $a * $n + $b)){
			$n++;
		}
		if($n > $biggest_n){
			$biggest_n = $n;
			$solution_a = $a;
			$solution_b = $b;
		}
	}
}
print "solution: ", $solution_a*$solution_b;

sub sieve_of_eratosthenes{
	my $n = shift;
	@array=();
	for my $i (2..$n){
		$array[$i] = 1; 
	}

	for($i = 2; $i < sqrt($n); $i++){
		if($array[$i]){
			for($j = 0; ( ($i**2)+$j*$i )< $n; $j++){
				$array[($i**2)+$j*$i] = 0;	
			}
		}
	}
	@output;
	for($i = 0; $i < $#array; $i++) {
		if($array[$i]){
			push @output, $i;
		}
	}
	return @output;
}

sub is_prime{
    my $number = shift;
    my $divisor = 2;
    if($number < 0) {
    	$number*=-1;
    }
    my $sqrt = sqrt $number;
    while(1) {
        if ($number%$divisor == 0) {
            return 0;
        }
        if ($divisor < $sqrt) {
            $divisor++;
        } else {
            return 1;
        }
    }
}


	