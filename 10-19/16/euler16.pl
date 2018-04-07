use bigint;

$start = 2;
$result = $start << 999;
my @nums = $result =~ /\d/g;
$sum=0;
grep { $sum += $_ } @nums;
print $sum;
