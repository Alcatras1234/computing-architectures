.include "macros.asm"
.data 
	.align  2
	array:  .space 64   # 64 �����
	arrend:                       # ������� �������
.text
	main:
	        la      t0 array   
	        la      s1 arrend       # �������
	        li 	t4, 11 
	        call enter
	        call fill
	        call sum
		EXIT
		
.include "enter.asm"
.include "fill.asm"
.include "sum_check.asm"

	
