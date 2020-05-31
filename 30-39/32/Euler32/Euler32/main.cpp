#include <iostream>
#include <set>

bool contains_digit(int number, int digit) {
	while (number > 0)
	{
		if (number % 10 == digit) {
			return true;
		}
		number /= 10;
	}
	return false;
}

//valid when it contains no duplicate digits and has no 0-digit 
bool is_valid_number(int number) {
	while (number > 9) {
		if (contains_digit(number / 10, number % 10) || number%10 == 0) {
			return false;
		}
		number /= 10;
	}
	return true;
}

bool both_unique_digits(int a, int b) {
	while (a > 0)
	{
		if (contains_digit(b, a % 10)){
			return false;
		}
		a /= 10;
	}
	return true;
}
// a * b = c
int main() {
	int c;
	std::set<int> good_outcomes;
	for (int a = 2; a < 99; a++) {
		if (is_valid_number(a)) {
			c = 0;
			int b = a < 10 ? 1234 : 123;
			while (c <= 9999) {
				while (!both_unique_digits(a, b) || !is_valid_number(b)) {
					b++;
				}
				c = a * b;
				if (c <= 9999 && is_valid_number(c) && both_unique_digits(b, c) && both_unique_digits(a, c)) {
					std::cout << "Result found: " << a << " * " << b << " = " << c << std::endl;
					good_outcomes.emplace(c);
				}
				b++;
			}
		}
	}
	int sum = 0;
	for (const int& element : good_outcomes) {
		sum += element;
	}
	std::cout << "End result: " << sum << std::endl;
	std::cin.get();
	return 0;
}