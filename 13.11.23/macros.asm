.macro STRCPY (%start, %end, %result)
	mv a1 %start
	mv a2 %end
	call strcpy
	mv  %result %end
.end_macro 

.macro read_str(%x)
	mv a0 %x
	li a1 127
	li a7, 8
	ecall
.end_macro 

.macro print_str(%x)
	.data
	 	str: .space %x
	.text
		la a0, %x
		li a7, 4
		ecall
.end_macro 
