#include <time.h>
#include <stdio.h>
#include <stdlib.h>

#define N 10

void swap(int *xp, int *yp)
{
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
}

void bubbleSort(int arr[], int n)
{
    int i, j;
    for (i = 0; i < n-1; i++)
        
        // Last i elements are already in place
        for (j = 0; j < n-i-1; j++)
            if (arr[j] > arr[j+1])
                swap(&arr[j], &arr[j+1]);
}

int main()
{
    int arr[N];
    int r;
    srand(time(NULL));
    for(int i = 0; i < N; i++){
        r = rand() % 50;
        arr[i] = r;
    }
    
    bubbleSort(arr, N);
    
    /*for(int i = 0; i < N; i++){
        printf("%d\n", arr[i]);
    }*/
    
    return 0;
}
