$amount = 999;    
$max_denominator;
$max_cycle = 0;
numbers: foreach $num ( 2 .. $amount ) {
    #manually divide 1 in steps by multiplying it by 10 first every time, to get the next digit
    my $rest = 1;
    my %first_seen;
    my $count = 0;
    while ($rest) {#while rest not 0
        $count++;
        $rest *= 10;
        $digit = int( $rest / $num );#rounded next digit
        $rest = $rest % $num;#no point to continue if this is 0
        printf("%d\n", $digit);
        if ( exists $first_seen{"$digit:$rest"} ) { 
            #the digit will interact the same way with the $rest again so we have a cycle
            my $cycle = $count - $first_seen{"$digit:$rest"};
            if ( $cycle > $max_cycle ) {
                $max_cycle       = $cycle;
                $max_denominator = $num;
            }
            next numbers;
        }
        else {
            $first_seen{"$digit:$rest"} = $count;
        }
    }
}

printf "%d\n", $max_denominator;
