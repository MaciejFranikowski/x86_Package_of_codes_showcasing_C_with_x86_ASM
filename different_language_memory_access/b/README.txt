In the asm file there is defined memory for two global variables, which is later directly accessed in the C code.
The variables are altered in the C code, to showcase this functionality.

To create an executable file run:
gcc -O3 zadanie3_2b.s zadanie3_2b.c -o zadanie3_2b

To run the executable:
./zadanie3_2b
