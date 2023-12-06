.include "stack.asm"
.include "macros"
.global display
.text
display:
	push(ra)
	push(s0)
	push(s1)
	push(s2)
	mv s0 a0
	mv s1 a1
	lui s2 0xffff0
	li t0 0xf #
	bgt s0 t0 overflow
check:
	get_code(s0, t1)
	bnez s1 right
	j left
overflow:
	li t3, 0x80
	and s0 s0 t0 #get digit which < 15. 15 and 16 = 0
	get_code(s0, t1)
	or t1 t1 t3 #enter point in number
	bnez s1 right
	j left
right:
	sb t1, 0x10(s2)
	j end
left:
	sb t1, 0x11(s2)
	j end
end:
	pop(s2)
	pop(s1)
	pop(s0)
	pop(ra)
	ret
