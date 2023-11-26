.include "macros.asm"
.data
	default_name: .asciz "output.txt"
.global write
.text
write:
	mv t3 a5 #save filename
	mv  t1 a6 #save buf
	mv t0 a2
	#####
	li t4 '\n'
	mv t5 t3 #filename
	mv t2 t3 #save for check on null str in name
loop:
#skip while t6 != \n
	lb t6 (t5)
	beq t4 t6 replace
	addi t5 t5 1
	j loop
replace:
	sb zero(t5)
	mv a0 t3 # name, which enter user
out:
	li a7 1024 #system call for open file
	li a1, 1 #open for writing (flags are 0: read, 1: write)
	ecall
	mv s6 a0 #save the file descriptor
#Write to file just opened
	li a7 64 #system call for write to file
	mv a0 s6 #file descriptor
	mv a1 t1 #adress of buffer from which to write
	mv a2, t0 #enter in a2 str lenght
	ecall #write to file
###############
# Close the file
	li   a7, 57       # system call for close file
	mv   a0, s6       # file descriptor to close
	ecall             # close file
	ret
    ###############################################################
	
