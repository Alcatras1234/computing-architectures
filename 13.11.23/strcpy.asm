.include "stack.asm"
.data

.global strcpy
.text
strcpy:
	push(ra)
	push(s0)
	push(s1)	
	mv s0 a1
	mv s1 a2 
work:
	lbu t1 (s0)
	beqz t1, end
	sb t1 (s1)
	addi s0 s0 1
	addi s1 s1 1
	j work
end:
	sb zero (s1)
	addi s1 s1 1
	mv a0 s1
	pop(s1)
	pop(s0)
	pop(ra)
	ret