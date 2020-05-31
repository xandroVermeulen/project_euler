#include <iostream>

//solved using: dynamic programming
int main() {
	int target = 200;
	int coins[] = { 1, 2, 5, 10, 20, 50, 100, 200 };
	int possibilities_accu[201] = { 0 };
	possibilities_accu[0] = 1;
	//for every coin, accumulate the amount of ways to make 1p,2p,3p,..200p in the corresponding array position
	for (int coin_nr = 0; coin_nr < 8; coin_nr++) {
		for (int counter = coins[coin_nr]; counter <= target; counter++) {
			//#ways to create the counter_value without the current coin   (possibilities_accu[counter])    (~previous coin_nr iteration)
			//+ #ways to create the remainder     (possibilities_accu[counter - coins[coin_nr]])
			possibilities_accu[counter] += possibilities_accu[counter - coins[coin_nr]];
		}
	}
	std::cout << possibilities_accu[target] << std::endl;
	std::cin.get();
}