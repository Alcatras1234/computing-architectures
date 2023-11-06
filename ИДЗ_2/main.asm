.include "mac_lib.asm"
.include "stack.asm"
.text
	PRINT_STR("Enter X for sin(x); ")
	ENTER_DOUBLE(fa0)
	call funct_init #do work and get result sin(x) where x is radian
	PRINT_DOUBLE(fa1)
	li a7 10
	ecall

