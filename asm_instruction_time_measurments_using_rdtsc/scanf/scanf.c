#include<stdio.h>

unsigned long long int rdtsc();

int input;
unsigned long long int t1,t2;

int main(){
	for(int i = 0; i < 10; i ++){
	t1 = rdtsc();
	(void)scanf("%d",&input);
	t2 = rdtsc();

	printf("%llu\n", (t2-t1));

	}

}
