STRING_LEN = 12
CHAR_LEN = 1
TOTAL_LOCAL_MEMORY = STRING_LEN + CHAR_LEN
ARGUMENTS_PUSHED_SPACE = 12
STRING_STACK_ADDRESS = -STRING_LEN
CHAR_STACK_ADDRESS = -STRING_LEN - CHAR_LEN


.data
# Read a char and an 11 long string. 
# (-1 in comparison to reserved space, because of the terminating null)
SCANF_STRING:   .string "%c%11s"
# Print out a char and a string.
PRINTF_STRING:  .string "Char: %c  String: %s"

.text
    .globl main
    .type main, @function
main:
# Create a new frame and store the frame pointer.
    pushl %ebp
    movl %esp, %ebp
# Allocating 13 bytes of stack space.
    subl $TOTAL_LOCAL_MEMORY, %esp    

# As the third argument for scanf, get the address of the space for the string
# and push it to the stack.
    leal STRING_STACK_ADDRESS(%ebp), %eax                
    pushl %eax
# As the second argument for scanf, get the address of the space for the char
# and push it to the stack.
    leal CHAR_STACK_ADDRESS(%ebp), %eax
    pushl %eax
# As the first argument for scanf, push the address of the format string.
    pushl $SCANF_STRING
    call scanf
# Stack cleanup after pushing the addresses.
    addl $ARGUMENTS_PUSHED_SPACE, %esp

# As the third argument for printf, get the address of the space for the string
# and push it to the stack.
    leal STRING_STACK_ADDRESS(%ebp), %eax
    pushl %eax 
# As the second argument for printf, get the VALUE of the char under -13(%ebp)
# address and push it to the stack.
    movb CHAR_STACK_ADDRESS(%ebp), %al
    pushl %eax
# As the first argument for printf, push the address of the format string.
    pushl $PRINTF_STRING
    call printf
# Stack cleanup after pushing the addresses and the value.
    addl $ARGUMENTS_PUSHED_SPACE, %esp
    
# Restore the old frame.
    movl %ebp, %esp
    popl %ebp
ret
