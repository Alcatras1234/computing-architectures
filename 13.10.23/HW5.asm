.extern enter, 32
.include "macros.asm"

.data 
	words:  .asciz "Enter number: "
	.align  2
	array:  .space 64   # 64 �����
	arrend:                       # ������� �������
.text
	main:
	        la      t0 array   
	        la      s1 arrend       # �������
	        li 	t4, 11 
	        jal enter
		EXIT

	