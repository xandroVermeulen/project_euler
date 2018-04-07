//super slow, thought about a better solution in euler14_alt.cpp

#include <iostream>
using namespace std;

int calculate_collatz(int n){
	int chain = 0;
	while(n != 1){
		//cout << n << " ";
		chain++;
		if(n % 2 == 0){
			n /= 2;
		} else{
			n = 3 * n + 1;
		}
	}
	return chain;
}

int main(){
	int current_chain;
	int max_chain = 0;
	int max_nr;
		
	for(int i = 1; i <= 1000000; i++){		
		current_chain = calculate_collatz(i);			
		if(current_chain > max_chain){
			max_chain = current_chain;
			max_nr = i;
		}
	}
	cout << "result: " << max_nr << "(" << max_chain << ")" << endl;
}
