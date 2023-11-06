#IN: fa0 - x
#OUT fa0 - sin(x)
.include "stack.asm"
.include "mac_lib.asm"
.data
	epsilon: .double 0.0005
	.one_1: .double 1.0
.text
.global funct_init
funct_init:
	push(ra)
	push(s0) #pow
	push(s1) #counter
	push_double(fs0) #result
	push_double(fs1) #denomirator
	push_double(fs2) # x
	push_double(fs3) #n/d
	fld fs3, epsilon, t3
	fld fa1, epsilon, t3 #board
	li s0, 1 #pow
	li s1, 1 #counter
	li t1, 300 #board
	fmv.d fs2 fa0 #get fa0 in fs2
func_loop:
	fgt.d t4 fa1 fs3 #t4 equal 1 if fa1 > fs0, else t4 = 0
	bnez t4 return
	beq s1, t1, return #if couter bigger than border
	pow(fs2, s0, ft0)#ft0 - numerator
	FACTORIAL(s0, a5)
	fcvt.d.w fs1 a5 #change int(s0) to double(fs1)
	fdiv.d fs3 ft0 fs1 #n/d
	PLUS_POW(s0)#change pow 2n+1
	EVEN(s1, t0) # 1 if odd, 0 if even
	beqz t0, even#check s0 odd or even
	j odd
even:
	fsub.d fs0 fs0 fs3 
	addi s1 s1 1
	j func_loop
odd:
	fadd.d fs0 fs0 fs3
	addi s1 s1 1
	j func_loop
return:
	fmv.d fa1 fs0 #return result in fa1 
	pop_double(fs3)
	pop_double(fs2)
	pop_double(fs1)
	pop_double(fs0)
	pop(s1)
	pop(s0)
	pop(ra)
	ret
	
