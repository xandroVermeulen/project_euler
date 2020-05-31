use bigint;

print calculate_sum_digits(factorial(100)), "\n";

sub factorial {
   my $n = $_[0];
   my $prod = 1;
   $prod *= $n-- while $n > 0;
   return $prod;
}

sub calculate_sum_digits{
	my @nums = $_[0] =~ /\d/g;
	$sum=0;
	grep { $sum += $_ } @nums;
	return $sum;
}
