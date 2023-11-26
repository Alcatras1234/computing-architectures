#a5 - filename
#a6 - strbuf
.include "stack.asm"
.include "macros.asm"
.eqv TEXT_SIZE 512
.data
	er_name_mes:    .asciz "Incorrect file name\n"
	er_read_mes:    .asciz "Incorrect read operation\n"
.global read
.text
read:
	push(ra)
	push(s0)
	push(s1)
	push(s2)
	#replace into file name '\n' on '\0'.
	#this is a basicly prectic for correctly work)
	mv t5 a5 #filename
	mv t3 a6 #strbuf
	li t4 '\n'
loop:
	lb t6(t5)
	beq t4 t6 replace
	addi t5 t5 1
	j loop
replace:
	sb zero(t5)
	#####################
	li a7 1024 #system call for open the file
	mv a0 a5 #save in a0 filename
	li a1 0 #open for read(flag = 0)
	ecall 
	li s1, -1 #check on correctly open
	beq a0 s1 er_name
	mv s0 a0 #save file descriptor
	#Read info into opened file
	li a7, 63 #System call for reading ito the file
	mv a0 s0 #descriptor file
	mv a1 t3 #adress buffer for reading text
	li a2 TEXT_SIZE #size reading half
	ecall #reading
	#check on correctly read
	beq a0 s1 er_read
	mv s2 a0 #save length text
	####################
#CLOSE FILE
	li a7, 57 #system call for closing file
	mv a0 s0 #descriptor file
	ecall #closing
	####################
#SET ZERO IN END READ STR
	mv t0 t3 #Adress on start buffer
	add t0 t0 s2 #go to last read char(bananA - A is last one)
	addi t0 t0 1 #place for zero
	sb zero(t0)
	#mv a0 t3
	#li a7, 4
	#ecall
	pop(s2)
	pop(s1)
	pop(s0)
	pop(ra)
	ret
er_name:
	print_str("Incorrect file name\n")
er_read:
	print_str("Incorrect read operation\n")
	
	
	
	   
