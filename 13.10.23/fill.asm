.global fill
.extern sum_check, 32
.include "macros.asm"
.text
	fill: 
		ENTER_NUMBER(a0)
		sw a0(t0)
		addi t5 t5 1
		addi t0 t0 4
		blt t5 t3 fill
		la t0, array
		li t5, 0
		jal sum