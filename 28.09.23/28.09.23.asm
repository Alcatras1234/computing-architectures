.data
words:  .asciz "Enter number: "
sep:    .asciz  "--------\n"    # Строка-разделитель (с \n и нулём в конце)
.align  2
array:  .space 64   # 64 байта
arrend:                       # Граница массива
int_1:  .asciz "Введите кол - во элементов в массиве не меньше 1 и не больше 10: "
excep_mes: .asciz "Нужно ввести число от 1 до 10\n"
overfl: .asciz "Переполнение\n"
.text
        la      t0 array   
        la      s1 arrend       # Счётчик
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
	add t6 t6 a0
	addi t5 t5 1
	addi t0 t0 4
	slt s2, zero, t6
	slt s3, zero, a0
	beq s2 s3 check_overflow
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
	li a7, 1 #вывод просуммированных чисел
	ecall
	li a0, ' '
	li a7, 11
	ecall
	j print
check_overflow:
	add s4 t6 a0
	slt s5, s4,  zero #if  s4 < zero, set s5 1. I am do it beacause, if t6 + a0 get number, 
	#which bigger tham 4 byte, result get number with a different sign
	beq s2, s5, overflow #for exp, s2 = 1, s5 = 1 => overflow 'cause s4 < zero
	#despite the fact that numbers, for example, have a positive sign
	j sum

	
