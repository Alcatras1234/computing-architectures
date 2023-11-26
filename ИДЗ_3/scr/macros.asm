.macro push(%x)
	addi	sp, sp, -4
	sw	%x, (sp)
.end_macro

.macro pop(%x)
	lw	%x, (sp)
	addi	sp, sp, 4
.end_macro

.macro strlen(%buff)
	li a4 0
	mv t2 %buff
	loop1:
		
		lb t1(t2)
		beqz t1 end1
		addi t2 t2  1
		addi a4 a4 1
	
		j loop1
	end1:
		mv s10 a4
.end_macro

.macro read_file(%filename, %strbuf) 
	mv a5 %filename
	mv a6 %strbuf
	call read
.end_macro

.macro write_file(%filename, %x, %s)
	la a5 %filename
	mv a6 %x #buf
	mv a2 %s
	call write
.end_macro

.macro read_str(%buff, %size) 
.text
	la a0 %buff
	li a1 %size
	li a7 8
	ecall
.end_macro 

.macro print_str (%x)
   .data
	str:
	   .asciz %x
   .text
	   push (a0)
	   li a7, 4
	   la a0, str
	   ecall
	   pop	(a0)
.end_macro

.macro print_char (%x)
.data
	chr: .asciz %x
.text
   la a0 chr
   li a7 11
   ecall
.end_macro


.macro print_buf(%x)
	la a0 %x
	li a7, 4
	ecall
.end_macro 

.macro change_con(%x, %y) #x - strbuf, y - lettersbuf
	mv a5 %x
	mv a6 %y
	call change_consonants
.end_macro
