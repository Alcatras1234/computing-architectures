.global enter
.extern fill, 32
.include "macros.asm"
.text
	enter: 
		PRINT("Enter the number of elements from 1 to 10 : ")
		ENTER_NUMBER(s7)
		mv t3 s7 # change array arrend
		bge t3 t4 exception
		blez t3 exception
		li t5, 0
		jal fill
	exception:
		PRINT("--------\n")
		PRINT("You must enter number from 1 to 10 \n")
		j enter
	