def is_valid(num, denom):
    print([num], " ")


outcome_numerator = 1
outcome_denominator = 1
for numerator in [x * 0.01 for x in range(1, 100)]:
    for denominator in [x * 0.01 for x in range(int(numerator*100) + 1, 100)]:
        if int(numerator*100) % 10 == 0 and int(denominator*100) % 10 == 0 \
                and is_valid(numerator, denominator):
            outcome_numerator = outcome_numerator * numerator
            outcome_denominator = outcome_denominator * denominator
print([outcome_numerator, outcome_denominator], " ")





