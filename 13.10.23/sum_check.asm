.text
	sum:
		lw a0(t0)
		sltz s2, t6
		sltz s3, a0
		beq s2 s3 check_overflow
	sum_next:
		add t6 t6 a0
		addi t5 t5 1
		addi t0 t0 4
		blt t5 t3 sum
		j print
	overflow:
		PRINT("OVERFLOW\n")
	        PRINT_INT(t5)
		PRINT_CHAR(' ')
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
	print: 	
		PRINT_INT(t6)
		ret
