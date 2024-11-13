#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

int main(int argc, char **argv)
{

    char* filename = argv[1];
    //printf("%s\n", filename); 

    FILE* fp;
    char buffer[255];
    fp = fopen(filename, "r");

    //check if file exists
    if (fp == NULL){
       printf("file does not exists %s", filename);
       return 0; 
    } 

    fgets(buffer, 255, fp);
    int n = atoi(buffer); 
    int arr[n];
    fgets(buffer, 255, fp); //salto la linea vuota

    int i = 0;
    while (fgets(buffer, 255, fp) != NULL)  {
       arr[i] = atoi(buffer); 
       //printf("%d\n", arr[i]);
       i++;
    }
    
    bubbleSort(arr, n);
    
    /*for(int i = 0; i < n; i++){
        printf("%d\n", arr[i]);
    }*/
    
    return 0;
}
