#include<stdio.h>

unsigned long long int rdtsc();

char string[10] = "0123456789";
unsigned long long int t1,t2;

int main(){
        for(int i = 0; i < 10; i ++){
        t1 = rdtsc();
        printf("%s\n",string);
        t2 = rdtsc();

        printf("%llu\n", (t2-t1));

        }

}

