.text
.global change_zero_on_min
	change_zero_on_min:
		lw t2(s0)
		beqz t2, change #go to change t2 equal 0 on t6 which equal min
		sw t2(s2) #enter t2 in B array
		addi s2 s2 4
		addi s0 s0 4 
		addi t3 t3 1 # Update counters 
		blt t3 s1 change_zero_on_min #check counter t3
		li t3, 0 #reset
		ret
	change:  
		sw t6(s2) # Enter min value in B array in exchange for zero
		addi s0 s0 4
		addi s2 s2 4
		addi t3 t3 1 # Update counters
		j change_zero_on_min
		
		
		