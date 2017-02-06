#include <iostream>

int fact(int n)
{
	if(n <= 1) return 1;
	else return n * fact(n-1);
}

int main()
{
	std::cout << "Hello SWIG" << std::endl;
	std::cout << "Fact(5): " << fact(5) << std::endl;
	return 0;
}
