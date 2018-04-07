#include <iostream>
#include <vector>
using namespace std;

vector<int> data;

int calculate_collatz(unsigned int n){
	int chain = 1;
	int start = n;
	while(n != 1 && n >= start ){
		chain++;
		if(n % 2 == 0){
			n /= 2;
		} else{
			n = 3 * n + 1;
		}
	}
	chain += data[n];
	data[start] = chain;
	return chain;
}

int main(){
	data.resize(1000001);
	int current_chain;
	int max_chain = 0;
	int max_nr;	
	
	for(int i = 2; i <= 1000000; i++){		
		current_chain = calculate_collatz(i);		
		if(current_chain > max_chain){
			max_chain = current_chain;
			max_nr = i;
		}
	}
	cout << "result: " << max_nr << "(" << max_chain << ")" << endl;
}
