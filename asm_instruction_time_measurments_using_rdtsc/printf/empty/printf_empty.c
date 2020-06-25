#include<stdio.h>

unsigned long long int rdtsc();


unsigned long long int t1,t2;

#pragma GCC diagnostic ignored "-Wformat-zero-length"
int main(){
	for(int i = 0; i < 10; i ++){
	t1 = rdtsc();
	printf("");
	t2 = rdtsc();

	printf("%llu\n", (t2-t1));

	}

}
#pragma GCC diagnostic warning "-Wformat-zero-length"

