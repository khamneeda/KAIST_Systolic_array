#include <stdio.h>
#include <stdlib.h>

void hello_world(){
    printf("hello world from c_functions.c!\n");
}

int add(int a, int b){
    return a + b;
}

int* add_vec(int* a, int* b, int size){
    int* c = malloc(sizeof(int)*size);
    for (int i = 0; i < size; ++i){
        c[i] = a[i]+b[i];
    }
    return c;
}

void free_p(void* a){
    free(a);
}