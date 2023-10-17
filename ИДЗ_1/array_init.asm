.include "macros_lib.asm"
.text

.global init
	init:
		PRINT_STR("ENTER NUMBER ELEMENTS FROM 1 to 10:")
		li t1, 11 # border max value
		li t2, 1 #border min value
		ENTER_INT(s1)
		bgt s1 t1 exception #check if number greater that 10
		blt s1 t2 exception #check if number less that 1
		li t1, 0 #reset t1
		li t2, 0 #reset t2
		ret
	exception:
		PRINT_STR("\nNumber must be between 1 and 10\n")
		j init
