// C program for implementation of Bubble sort
#include <stdio.h>

#define ARRAY_SIZE 5
#define LOGS_ON 0
 
void swap(int *xp, int *yp)
{
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
}
 
// A function to implement bubble sort
void bubbleSort(int arr[], int n)
{
   int i, j;
   for (i = 0; i < n-1; i++)      
 
       // Last i elements are already in place   
       for (j = 0; j < n-i-1; j++) 
           if (arr[j] > arr[j+1])
              swap(&arr[j], &arr[j+1]);
}
 
/* Function to print an array */
/*
void printArray(int arr[], int size)
{
    int i;
    for (i=0; i < size; i++)
        printf("%d ", arr[i]);
    printf("\n");
}
*/

int fill_array(int* arr, int fill_sorted) {
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
 
// Driver program to test above functions
int main()
{
    int arr = malloc(sizeof(int) * ARRAY_SIZE);
	fill_array(arr, 0);
    int n = ARRAY_SIZE/sizeof(int);
    bubbleSort(arr, ARRAY_SIZE);
    //printf("Sorted array: \n");
    //printArray(arr, ARRAY_SIZE);
    return 0;
}
