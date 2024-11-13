#include <stdio.h>

#define ARRAY_SIZE 3

void fill_array(int* arr, int fill_sorted) {
	//printf("\n Filling the array ");
	int i;

	if(fill_sorted) {
		//printf("with sorted numbers...");

		for(i = 0; i < ARRAY_SIZE; ++i) arr[i] = i;
	} else {
		//printf("with random numbers...");

		for(i = 0; i < ARRAY_SIZE; ++i) arr[i] = rand();
	}

	//printf(" Done!");
} 
 
int main()
{
  int c, d, k, sum = 0;
  int first[ARRAY_SIZE][ARRAY_SIZE], second[ARRAY_SIZE][ARRAY_SIZE], multiply[ARRAY_SIZE][ARRAY_SIZE];
 
  fill_array(first, ARRAY_SIZE*ARRAY_SIZE);
  fill_array(second, ARRAY_SIZE*ARRAY_SIZE);
 
    for (c = 0; c < ARRAY_SIZE; c++) {
      for (d = 0; d < ARRAY_SIZE; d++) {
        for (k = 0; k < ARRAY_SIZE; k++) {
          sum = sum + first[c][k]*second[k][d];
        }
 
        multiply[c][d] = sum;
        sum = 0;
      }
    }
 
  return 0;
}
