.data
words:  .asciz "Enter number: "
sep:    .asciz  "--------\n"    # ??????-??????????? (? \n ? ???? ? ?????)
.align  2
array:  .space 64   # 64
arrend:                       # 
int_1:  .asciz "Ónter the number of elements from 1 to 10: "
excep_mes: .asciz "number must get 1 to 10\n"
overfl: .asciz "overflow\n"
.text
        la      t0 array   
        la      s1 arrend       # ???????
        li 	t4, 11  
enter: 
	la   a0, int_1
	li a7, 4
	ecall
	li a7, 5
	ecall
	mv t3 a0 # change array arrend
	bge t3 t4 exception
	blez t3 exception
	li t5, 0
fill: 
	li a7, 5
	ecall
	sw a0(t0)
	addi t5 t5 1
	addi t0 t0 4
	blt t5 t3 fill
	la t0, array
	li t5, 0
	j sum
sum:
	lw a0(t0)
	slt s2, zero, t6
	slt s3, zero, a0
	beq s2 s3 check_overflow
	
sum_next:
	add t6 t6 a0
	addi t5 t5 1
	addi t0 t0 4
	blt t5 t3 sum
	j print
exception:
	la a0 sep
	li a7 4
	ecall
	la a0 excep_mes
	li a7 4
	ecall
print: 
	mv a0 t6
	li a7, 1
	ecall
	li a7, 10
	ecall
overflow:
	la a0 overfl
	li a7, 4
	ecall
        mv a0, t5
	li a7, 1 #????? ???????????????? ?????
	ecall
	li a0, ' '
	li a7, 11
	ecall
	j print
check_overflow:
	add s4 t6 a0
	bgtz t6, check_overflow_positivie
	bltz t6, check_overflow_negative
check_overflow_positivie:
	bltz s4, overflow
	j sum_next
check_overflow_negative:
	bgtz s4, overflow
	j sum_next