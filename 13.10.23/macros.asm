.macro ENTER_NUMBER(%x)
	li a7, 5
	ecall
	mv %x a0
.end_macro 

.macro PRINT(%x)
	.data 
		str: .asciz  %x
	.text
		la a0, str
		li a7, 4
		ecall
.end_macro 
.macro PRINT_INT(%x)
	.text
		mv a0 %x
		li a7, 1
		ecall
.end_macro 
.macro PRINT_CHAR(%x)
	.text	
		li a0, %x
		li a7, 11
		ecall
.end_macro 

.macro EXIT()
	li a7, 10
	ecall
.end_macro 
