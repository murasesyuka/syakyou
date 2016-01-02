#include <iostream>

int multiply0(int n, int a)
{
	if (n == 1) return a;
	return multiply0(n-1, a) +a;
}

// Egyptian multiplication
bool odd(int n) { return n & 0x1; }
int half(int n) { return n >> 1; }

int multiply1(int n, int a)
{
	if (n == 1) return a;
	int result = multiply1(half(n), a + a);
	if (odd(n)) result = result + a;
	return result;
}

int multiply_by_15(int a)
{
	int b = (a+a) + a;
	int c = b+b;
	return (c+c) +b;
}

//2.2
int mult_acc0(int r, int n, int a)
{
	if (n == 1) return r + a;
	if (odd(n)){
		return mult_acc0( r + a, half(n), a+a);
	} else {
		return mult_acc0( r, half(n), a+a);
	}
}

int main(){
	using namespace std;
	cout << multiply_by_15(3) << endl;
	cout << mult_acc0(0, 15, 3) << endl;
}
