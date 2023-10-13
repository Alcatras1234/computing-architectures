
.data
int_1:  .asciz "¬ведите кол - во элементов в массиве не меньше 1 и не больше 10: "
.text
call exception
enter: 
	la a0, int_1
	li a7, 4
	ecall
	ENTER_NUMBER(a0)
	mv t3 a0 # change array arrend
	bge t3 t4 exception
	blez t3 exception
	li t5, 0
	ret 
.include "C:\HSE\ABC\13.10.23\exception.asm"