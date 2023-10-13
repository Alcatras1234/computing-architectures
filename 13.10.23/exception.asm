.data
	excep_mes: .asciz "Нужно ввести число от 1 до 10\n"
	sep:    .asciz  "--------\n"    # Строка-разделитель (с \n и нулём в конце)
.text 
	exception:
	la a0 sep
	li a7 4
	ecall
	la a0 excep_mes
	li a7 4
	ecall
	ret