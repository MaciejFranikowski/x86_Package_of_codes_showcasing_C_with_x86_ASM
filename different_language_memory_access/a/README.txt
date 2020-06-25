In the C file there are declared two global variables, which are later directly accessed in the assembly code.
The variables are altered in the asm code, to showcase this functionality.

To create an executable file run:
gcc -O3 zadanie3_2a.s zadanie3_2a.c -o zadanie3_2a

To run the exectuable:
./zadanie3_2a
