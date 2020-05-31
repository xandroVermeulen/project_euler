my $sum = 1;
my $grid_size = 1001;
my $steps = 0;
my $current_number = 1;

for(my $size = 3 ;$size <= $grid_size; $size+=2){
	$steps += 2;
	for my $diagonals (0..3){
		$current_number += $steps;
		$sum += $current_number;
	}}
print "Solution: ", $sum;