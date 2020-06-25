I'm using a virutal machine of 32-bit Linux, the distribution is Linux Mint 19. My processor is a Ryzen 5 3600, which clocks at 3.6 GHz. Two out of six cores were given to the VM.

The file c_file.c contains the first 4 functionalities:  writing to a register, writing to memory and system read/write.
These functionalities are defined as external functions, whose code is located in the asm_functions.s file.
Beforementioned functions were written fully in assembly code, in order to minimize the overhead from measuring time.

The scanf and print functionalities were written mostly in C, since the overhead from measuring time is very small in comparison
to the time it takes to call such functions.



For the first 4 functionalities, to get a executable file (to get a different functionality, change the function called in main, in c_file.c):
gcc -O3 c_file.c asm_functions.s -o zadanie3_4

To run:
./zadanie3_4
To run when using read functionality:
./zadanie3_4 < input



For scanf executable:
gcc -Wall -Wextra -Wno-unused-result -O3 rdtsc.s scanf.c -o scanf

To run:
./scanf < input



For empty printf executable:
gcc -O3 printf_empty.c rdtsc.s -o printf_empty

To run:
./printf_empty



For short string printf executable:
gcc -O3 short_string.c rdtsc.s -o short_string

To run:
./short_string



For short string with endl printf executable:
gcc -O3 short_string_endl.c rdtsc.s -o short_string_endl

To run:
./short_string_endl
