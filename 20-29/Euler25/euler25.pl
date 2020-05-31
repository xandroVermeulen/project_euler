use bignum;

my $x = 1;
my $y = 1;
my $next = $x + $y;
my $index = 3;

while(length($next) != 1000){
	$x = $y;
	$y = $next;
	$next = $x + $y;
	$index++;
}

print $index;