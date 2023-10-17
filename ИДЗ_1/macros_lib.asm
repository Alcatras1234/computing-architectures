.macro ENTER_INT(%x)
	li a7, 5
	ecall
	mv %x a0
.end_macro 

.macro PRINT_STR(%x) 
	.data 
		str: .asciz %x
	.text
		la a0 str
		li a7, 4
		ecall
.end_macro 
.macro PRINT_CHAR(%x) 
	.text
		li a0 %x
		li a7, 11
		ecall
.end_macro

.macro PRINT_INT(%x) 
	.text
		mv a0 %x
		li a7, 1
		ecall
.end_macro 

.macro PRINT_Array 
	.text
		print:
			lw a0 (s2)
			PRINT_INT(a0)
			PRINT_CHAR(' ')
			addi s2 s2 4
			addi t3 t3 1 #Update Counters
			blt t3 s1 print #check counter t3
.end_macro 

.macro EXIT 
	li a7, 10
	ecall
.end_macro 
