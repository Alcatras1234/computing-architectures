.include "macros_lib.asm"
.data
	array: .space 64
	arrayB: .space 64
.text
	la s0, array #A space
	la s2, arrayB #B space
	main:
		call init #enter number elements in array, result is s1 - contain number elemts array
		call fill #fill array A(s0), get s1 which equal border of array A
		la s0, array #A space
		call search_min_value #get array A(s0), then in t6 i add min value which not equal zero
		la s0, array #A space
		call change_zero_on_min #get array A(s0), Array B(s2), min value t6. Result is array B 
		#which equal array A but zero changed on t6(min value)
		la s2, arrayB #A space
		PRINT_Array #Print array B 
		EXIT #exit, get code 0
