.include "macros.asm"
.data
.align 2
test: .asciz "TESTSTR:"
str: .space 128
str_dest: .space 128
.text
	la s1 str_dest
	#la s0 str
	la s0 test
	#read_str(s0)
	STRCPY(s0, s1, s3)
	mv a0 s3
	li a7, 4
	ecall
	li a7 10
	ecall
	
	