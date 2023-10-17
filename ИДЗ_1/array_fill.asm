.include "macros_lib.asm"
.text
.global fill
	fill:
		ENTER_INT(t2) 
		sw t2 (s0) #add t2 t0 s2 adress
		addi s0 s0 4
		addi t6 t6 1 #update cunters
		blt t6 s1 fill # check do work while t6 less s1
		li t6, 0 #clear t6
		li t2, 0 #clear t2
		ret
		
