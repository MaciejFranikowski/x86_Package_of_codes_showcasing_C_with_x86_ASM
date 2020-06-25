#include<stdio.h>

extern short short_val;
extern char* char_ptr;

char array[10] = "0123456789";
int main(){

// Here the pointer memory in the form of a C variable is assigned a value
// of the address of the char array.
	char_ptr = array;
	printf("Short: %hd\n", short_val);
	printf("String: %s\n", char_ptr);	
	
// Modifying the variables to further showcase the functionality.
	short_val = 2;
	char_ptr = "1234567890";
	printf("Short: %hd\n", short_val);
	printf("String: %s\n", char_ptr);
	
	return 0;

}
