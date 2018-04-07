#include <iostream>
using namespace std;

long double factorial(int n){
	if(n == 1){
		return 1;
	}
	return n*factorial(n-1);
}

int main(){
	int size = 20;
	// basic combination formula   C(np) = n! / (p!(n-p)!)  =  40! / (20! * 20!) 
	long double n = factorial(2 * size);
	long double p = factorial(size);
	double res = n/(p*p);	


	cout << fixed <<"result: " << res;
}
