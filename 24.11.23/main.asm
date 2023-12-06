.include "macros"
.text
main:
	li s0 0
	li s1 31
loop_left:
	displ(s0, 1)
	beq s0 s1 loop_left_end
	addi s0 s0 1
	sleep(300)
	j loop_left
loop_left_end:
	sleep(300)
	reset_disp
	li s0 0
	
	
loop_right:
	displ(s0, 0)
	beq s0 s1 loop_right_end
	addi s0 s0 1
	sleep(300)
	j loop_right
loop_right_end:
	sleep(300)
	reset_disp
	li a7 10
	ecall
