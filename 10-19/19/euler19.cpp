#include <iostream>
using namespace std;

int amount_of_days_in_month(int month, int year){
	switch(month){
		case 1: case 3: case 5: case 7: case 8: case 10: case 12:
			return 31; break;
		case 2: case 4: case 6: case 9: case 11:
			return 30; break;
	}
	if((year % 1000 == 0 && year % 400 == 0) || (year % 1000 != 0 && year % 4 == 0)){
		return 29;
	}
	return 28;
}

int main(){
	int first_day = 0;
	int sum = 0;
	
	for( int year = 1901; year <= 2000 ; year++){
		for( int month = 1; month <= 12; month++){
			if(first_day == 6){
				sum++;
			}
			first_day = (first_day + amount_of_days_in_month(month, year)) % 7;
		}
	}
	cout << "result: " << sum << endl;
}
