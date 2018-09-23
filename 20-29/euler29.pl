my $max_range = 100;

my %seen;
for(my $a = 2; $a <= $max_range; $a++){
	for(my $b = 2; $b <= $max_range; $b++){
		$seen{$a**$b}=1;
	}
}
print "Solution: ",scalar keys %seen;
 