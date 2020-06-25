.data
# Declaration of a 2 bytes, each filled with 04 value.
# In the C code this memory will be a short variable.
.global short_val
short_val:
.space 2, 4

# Declaration of 4 bytes, filled with zero's.
# In the C code this memory will be a pointer to char value.
.global char_ptr
char_ptr:
.space 4
