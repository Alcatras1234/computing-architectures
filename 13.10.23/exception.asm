.data
	excep_mes: .asciz "����� ������ ����� �� 1 �� 10\n"
	sep:    .asciz  "--------\n"    # ������-����������� (� \n � ���� � �����)
.text 
	exception:
	la a0 sep
	li a7 4
	ecall
	la a0 excep_mes
	li a7 4
	ecall
	ret