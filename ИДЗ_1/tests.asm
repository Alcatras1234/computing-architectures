.include "macros_lib.asm"
.data
	.align 2
	array_A_1: .word 1, 2, 3
	correct_array_B_1: .word 1, 3, 2
	real_array_B_1: .space 12 # 12 bytes
	array_A_2: .word 1, 16, 8, 35, 24, 50
	correct_array_B_2: .word 1, 8, 24, 16, 35, 50
	real_array_B_2: .space 24 # 24 bytes
	array_A_3: .word 1
	correct_array_B_3: .word 1
	real_array_B_3: .space 4 # 1 byte
	array_A_4: .word 2, 3, 4, 5, 6, 7, 8
	correct_array_B_4: .word 2, 4, 6, 8, 3, 5, 7
	real_array_B_4: .space 28 # 28 bytes