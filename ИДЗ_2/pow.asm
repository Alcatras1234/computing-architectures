# IN fa0 - X value
# IN a0 - N value
# OUT fa0 - result
.include "stack.asm"
.data 
	one: .double 1.0
.global start
.text
start:
	push(ra)
	push(s0)
	push_double(fs0)
	push_double(fs1)
	
	fmv.d fs0 fa0
	mv s0 a0
	
	fld fs1 one t0 #fs1 must be equal 1, no zero
pow:	
	beqz s0 return
	fmul.d fs1 fs1 fs0
	addi s0 s0 -1
	j pow
return:
	fmv.d fa0 fs1 #return esult in fa0
	pop_double(fs1)
	pop_double(fs0)
	pop(s0)
	pop(ra)
	ret
