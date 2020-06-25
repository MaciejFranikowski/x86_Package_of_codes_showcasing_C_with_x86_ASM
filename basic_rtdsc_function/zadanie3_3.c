#include<stdio.h>

unsigned long long int rdtsc();

int main(){
 
 for(int i =0; i < 10; i++){
	
	 printf("%llu\n", rdtsc());

 }

 return 0;

}
