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

int main(){
	using namespace std;
	cout << multiply1(41,59) << endl;
}
