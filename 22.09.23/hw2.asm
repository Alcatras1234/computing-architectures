.data
	numerator: .asciz "Input Numerator "
	denomirator: .asciz "Input Denominator "
	er: .asciz "U cant have denominator which ecual 0"
	nullstr: .asciz "\n"
	qofd: .asciz "quotient of division: "
	remainder: .asciz "remainder: "
.text
	while:
	li t3, -1
	li t4, 1
	li t5, 0 # числитель > 0 = 0 else 1
	li t6, 0 # знаменатель > 0 = 0 else 1
	la a0, numerator
	li a7, 4
	ecall
	li a7, 5
	ecall
	mv t0, a0
	
	la a0, denomirator
	li a7, 4
	ecall
	li a7, 5
	ecall
	mv t1, a0
	beqz t1, error
	j check
	
	check:
       	bltz t0, nomerator_is_negative
       	bltz t1, denomirator_is_negative
       	blt t0, t1, operation_special
       	j operation
       	
       	operation_special:
       	li t3, 0
       	j end
       	
       	
       	nomerator_is_negative:
       	neg t0,t0
       	li t5, 1
       	j check
       	
       	denomirator_is_negative:
       	neg t1,t1
       	li t6, 1
       	j check
       	
       	operation:
       	bltz t0, rema
       	sub t0, t0, t1
       	addi t3, t3, 1
       	j operation
       	
       	rema:
       	add t0, t0, t1
       	j end
       	
       	dr:
       	neg t3, t3
       	li t5, 0
       	neg t0, t0
       	j end
       	
       	dr_1:
       	neg t3, t3
       	li t6, 0
       	j end
       	
	end:
	bnez  t5, dr
	bnez t6, dr_1
	la a0, qofd
	li a7, 4
	ecall
	mv a0, t3
	li a7, 1
	ecall
	la a0, nullstr
	li a7, 4
	ecall
	la a0, remainder
	li a7, 4
	ecall
	mv a0, t0
	li a7,1
	ecall
	li a7, 10
	ecall
	
	error:
	la a0, er
	li a7,4
	ecall
	j while
	

	
	


	
	

	
	
	
	
	
