$sum = 0;
for my $i (1..1000){
	$sum += count_words_from($i);
}
print $sum, "\n";

sub count_words_from{
	$num = sprintf("%04d", $_[0]);
	$a = substr($num, 0, 1);#x000
	$b = substr($num, 1, 1);#0x00
	$c = substr($num, 2, 1);#00x0
	$d = substr($num, 3, 1);#000x

	if($c == 1 && $d < 9){		
		$count_d = 0;
		$count_c = count_letters_tenths($d);
	} else {
		$count_d = count_letters_d($d);
		$count_c = count_letters_c($c);
	}
	$count_b = count_letters_b($b);
	$count_a = count_letters_a($a);	
	$count_and = (($c > 0 || $d > 0) && $b > 0) ? 3 : 0;
	return $count_a + $count_b + $count_c + $count_d + $count_and;
}

sub count_letters_a{#x000
	if($_[0] == 0){
		return 0;
	}
	@letter_count=(0,11);
	return $letter_count[$_[0]];
}

sub count_letters_b{#0x00
	if($_[0] == 0){
		return 0;
	}
	return count_letters_d($_[0]) + 7;
}

sub count_letters_c{#00x0
	@letter_count=(0,4,6,6,5,5,5,7,6,6);
	return $letter_count[$_[0]];
}

sub count_letters_d{#000x
	@letter_count = (0,3,3,5,4,4,3,5,5,4);
	return $letter_count[$_[0]];
}

sub count_letters_tenths{#001x
	@letter_count = (3,6,6,8,8,7,7,9,8);
	return $letter_count[$_[0]];
}