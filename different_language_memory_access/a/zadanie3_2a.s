ARGUMENTS_PUSHED_SPACE = 12
ASCII_CODE_B = 0x62
NUMBER_OF_ITERATIONS = 9

.data
PRINTF_FORMAT_STRING:  .string "Char: %c String: %s\n"

.text
.globl main
.type main, @function

main:
# Create a new frame and store the %edi register value.
pushl %ebp
movl %esp, %ebp
pushl %edi

# Push the arguments from the C file on the stack, in order to call printf.
pushl $tab
pushl b
pushl $PRINTF_FORMAT_STRING
call printf
# Clean up the stack.
addl $ARGUMENTS_PUSHED_SPACE, %esp

# Change the ascii code from 'c' to 'b' in the char b.
movb $ASCII_CODE_B, b

# Move the address of the beginning of the string to %ecx.
movl $tab, %ecx
# Make sure the %edi register contains zero's
xorl %edi, %edi

# During this loop I add one to the ascii values of the string,
# to showcase the way it can be accessed.
start_loop:
	cmpl $NUMBER_OF_ITERATIONS, %edi
	je loop_exit
	movb (%ecx, %edi), %dl
	incl %edx
	movb %dl, (%ecx, %edi)
	incl %edi
	jmp start_loop
loop_exit:

# Push the, now modified, arguments from the C file on the stack, in order to call printf.
pushl $tab
pushl b
pushl $PRINTF_FORMAT_STRING
call printf
addl $ARGUMENTS_PUSHED_SPACE, %esp

# Restore the old frame and the %edi register value.
popl %edi
movl %ebp, %esp
popl %ebp

ret

