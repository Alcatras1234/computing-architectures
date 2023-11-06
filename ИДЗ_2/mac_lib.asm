.macro PRINT_STR(%x)
	.data
		std: .asciz %x
	.text
		la a0 std
		li a7, 4
		ecall
.end_macro 
.macro ENTER_DOUBLE(%x)
	li a7, 7
	ecall
	fmv.d %x, fa0
	
.end_macro 

.macro PRINT_INT(%x)
	.text	
		mv a0 %x
		li a7, 1
		ecall
.end_macro
.macro FACTORIAL(%x, %y)
	.text
		mv a0 %x
		call factorial
		mv %y a0
.end_macro
.macro PLUS_POW(%x) #get pow 2n + 1
	.text	
		addi %x %x 2
.end_macro

.macro EVEN(%x, %y) 
	.text	
		li a1, 1
		and a2 %x a1
		mv %y a2
	stop:
.end_macro
.macro PRINT_DOUBLE(%x)
	.text	
		fmv.d fa0 %x
		li a7, 3
		ecall
.end_macro

.macro pow(%x, %n, %out)
	fmv.d fa0 %x
	mv a0 %n
	call start
	fmv.d %out fa0
.end_macro 

