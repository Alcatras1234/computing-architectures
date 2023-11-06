# IN a0 - X value
# OUT a0 - result
.include "stack.asm"
.global factorial

.text
factorial:	
	beqz a0, first #if a0 = 0 => a0 = 1
	push(ra)
	push(s0)
	push(s1)
	mv s0 a0
	li s1, 1
fac_loop:
	beqz s0, finish #if s0 == 0
	mul s1 s1 s0
	addi s0 s0 -1
	j fac_loop
finish:	
	mv a0 s1 #return result in a0
	pop(s1)
	pop(s0)
	pop(ra)
	ret
first: 
	li a0, 1
	ret
	
	
	
	
