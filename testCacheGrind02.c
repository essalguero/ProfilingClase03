#include <iostream>
#include <cmath>

bool isPrime(int x)
{
	int limit = std::sqrt(x);
	
	for(int i = 2; i <= limit; ++i)
	{
		if ((x % i) == 0)
		{
			return false;
		}
	}

	return true;
}


int main()
{
	int primeCount = 0;

	bool* result = (bool*)malloc(1000000 * sizeof(bool));
	int* primes = (int*)malloc(1 * sizeof(int));

	for(int i = 0; i < 1000000; ++i)
	{
		if (isPrime(i))
		{
			++primeCount;
			primes = (int *)realloc(primes, sizeof(int) * (i + 1));
			primes[i] = i;
		}
	}

	return 0;
}
