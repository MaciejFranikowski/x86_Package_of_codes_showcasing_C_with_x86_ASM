SYS_READ = 3
SYS_WRITE = 4
STDIN = 0
STDOUT = 1
SYS_CALL = 0x80

ARBITRARY_VALUE = 1
CHAR_LEN = 1
LENGTH_64_BIT = 8
.data

# Buffer used for system read
buffer:
.space CHAR_LEN

buffer_len = .- buffer

# Global memory, to which the lower part of return value from rdtsc is written.
# Then in C time2 and time1 are subtracted.

# I opt to use only the lower part of the return value from rdtsc, because
# the operation times are much smaller than the return values, so it doesn't
# make a difference if we include the higher part.

.global time1
time1:
.space LENGTH_64_BIT

.global time2
time2:
.space LENGTH_64_BIT

# Char used for system write.
char:
.byte 'c'

.text

# Function write_to_register prepares two values, one before writing 
# to %ebx and one after.
# Sadly two more operations are measured, one movl (to move one value)
# and one xorl to prepare for another cpuid.
.global write_to_register
.type write_to_register, @function

write_to_register:
pushl %ebp
movl %esp, %ebp
pushl %ebx

xorl %eax, %eax

cpuid
rdtsc

# Move  the lower part of rdtsc return val to time1.
movl %eax, time1

# The measured operation.
movl $ARBITRARY_VALUE, %ebx

xorl %eax, %eax
cpuid
rdtsc

movl %eax, time2

popl %ebx
movl %ebp, %esp
popl %ebp

ret

# Function write_to_memory prepares two values, one before writing 
# to a buffer in memory and one after.
# Sadly two more operations are measured, one movl (to move one value)
# and one xorl to prepare for another cpuid.
.global write_to_memory
.type write_to_memory, @function

write_to_memory:
pushl %ebp
movl %esp, %ebp
pushl %ebx

xorl %eax, %eax

cpuid
rdtsc

movl %eax, time1

# The measured operation.
movb $ARBITRARY_VALUE, buffer

xorl %eax, %eax
cpuid
rdtsc

movl %eax, time2

popl %ebx
movl %ebp, %esp
popl %ebp

ret

# Function system_read prepares two values, one before using
# the system call read and one after.
# Sadly two more operations are measured, one movl (to move one value)
# and one xorl to prepare for another cpuid.
.global system_read
.type system_read, @function

system_read:
pushl %ebp
movl %esp, %ebp
pushl %ebx

xorl %eax, %eax
cpuid
rdtsc
movl %eax, time1

# The measured operation.
movl $SYS_READ, %eax
movl $STDIN, %ebx
movl $buffer, %ecx
movl $buffer_len, %edx
int $SYS_CALL

xorl %eax, %eax
cpuid
rdtsc

movl %eax, time2

popl %ebx
movl %ebp, %esp
popl %ebp

ret


# Function system_write prepares two values, one before using
# the system call write and one after.
# Sadly two more operations are measured, one movl (to move one value)
# and one xorl to prepare for another cpuid.

.global system_write
.type system_write, @function

system_write:
pushl %ebp
movl %esp, %ebp
pushl %ebx

xorl %eax, %eax
cpuid
rdtsc
movl %eax, time1

movl $SYS_WRITE, %eax
movl $STDOUT, %ebx
movl $char, %ecx
movl $CHAR_LEN, %edx
int $SYS_CALL
 
xorl %eax, %eax
cpuid
rdtsc

movl %eax, time2

popl %ebx
movl %ebp, %esp
popl %ebp

ret

