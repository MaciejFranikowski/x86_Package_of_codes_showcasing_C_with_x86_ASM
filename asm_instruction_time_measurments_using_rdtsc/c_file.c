#include<stdio.h>

extern unsigned long long int time1;
extern unsigned long long int time2;

// Set of usable functions.
extern void write_to_register();
extern void write_to_memory();
extern void system_read();
extern void system_write();

int main(){
	for(int i = 0; i < 20; i ++){
	// Put the currently used function here.
	write_to_register();
	
	printf("%llu\n", (time2 - time1));

	}
	return 0;
}
