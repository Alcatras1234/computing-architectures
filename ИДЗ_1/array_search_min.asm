.include "C:\HSE\ABC\ÈÄÇ_1\macros_lib.asm"
.text
.global search_min_value
	search_min_value:
		li t6 , 2147483647 # max value int
	search_min:
		lw t2 (s0) # take an element from the array
		beqz t2 next # if s0 equal zero, 
		bgt t6 t2 end #if t6 > t2, we change t6 on t2. It doint in end label
	next:
		addi s0 s0 4
		addi t3 t3 1 #update counters
		blt t3 s1 search_min #check counter t3
		li t3, 0 #reset 
		ret
	end: 
		mv t6, t2 #in t6 save min value array
		j next
		
