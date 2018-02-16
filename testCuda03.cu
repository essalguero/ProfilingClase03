#include <stdio.h>
#include <stdlib.h>



__global__ void prueba1(int* datos)
{
	int gid = (blockIdx.x * blockDim.x) + threadIdx.x;
	datos[gid] = gid;
}


int main()
{
	int numbloques = 128;
	int numthreads = 128;

	int* d_datos;
	int* d_datos2;

	cudaMalloc((void **) &d_datos, (sizeof(int) * numbloques * (numthreads - 1) - sizeof(int)));
	cudaMalloc((void **) &d_datos2, (sizeof(int) * numbloques * (numthreads - 1) - sizeof(int)));

	prueba1<<<numbloques, numthreads>>>(d_datos);

	cudaDeviceSynchronize();

	return 0;
}
