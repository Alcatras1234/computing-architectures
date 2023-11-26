#a5 - strbuf
#a6 - lettersbuf
.include "stack.asm"
.include "macros.asm"
.data
	letters: .space 55
.global change_consonants
.text
 change_consonants:
 	push(ra)
 	push(s0)
 	push(s1)

 	la t3, letters
 	mv s0 a5 #strbuf
 	mv s1 a6 #lettersbuf
 	li t0 100
 get_letters_mas:
 	li t2 'A'
 	sb  t2 (t3)
 	addi t3 t3 1
 	##
 	li t2 'E'
 	sb t2 (t3)
 	addi t3 t3 1
 	##
 	li t2 'I'
 	sb t2 (t3)
 	addi t3 t3 1
 	##
 	li t2 'O'
 	sb t2 (t3)
 	addi t3 t3 1
 	##
 	li t2 'U'
 	sb t2 (t3)
 	addi t3 t3 1
 	######################
 	li t2 'a'
 	sb t2 (t3)
 	addi t3 t3 1
 	##
 	li t2 'e'
 	sb t2 (t3)
 	addi t3 t3 1
 	##
 	li t2 'i'
 	sb t2 (t3)
 	addi t3 t3 1
 	##
 	li t2 'o'
 	sb t2 (t3)
 	addi t3 t3 1
 	##
 	li t2 'u'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 ' '
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '.'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 ','
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '!'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '?'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '@'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '#'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '$'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '%'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '^'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '^'
 	sb t2 (t3)
 	addi t3 t3 1
	
	li t2 '&'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '*'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '('
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 ')'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '-'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '_'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '+'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '='
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '['
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 ']'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '{'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '}'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 ';'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 ':'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2, 96
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 34
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '<'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '>'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '/'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 92
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '|'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	li t2 '~'
 	sb t2 (t3)
 	addi t3 t3 1
 	
 	
 start:
 	li t6, 55
 	la t3, letters
 	li t2, 0
 	lb t5(s0)
 	beqz t5, stop

 check_loop:
  	bgt t2 t6 replace #if t2 = t6 (board_) go next
 	lb t4, 0(t3)
 	beq t4 t5 add_in
 	addi t3 t3 1
 	addi t2 t2 1
 	j check_loop
 	
 add_in:
 	sb t5, 0(s1)
 	addi s1 s1 1
 	j go_start
 	
replace:
 	li t6, 10
 	div t1 t5 t0 #search hundred
 	beqz t1, tens
 	addi t1 t1 48 #48 is 0 in ASCII
 	sb t1, 0(s1)
 	addi s1 s1 1 # сотни
 	#search tens
 	rem t1 t5 t0 #t5 / 100 
 	div t1 t1 t6  # t1/ 10
 	addi t1 t1 48
 	sb t1, 0(s1)
 	addi s1 s1 1 # десятки
 	#search units
 	rem t1 t5 t6 #t5 / 100 
 	addi t1 t1 48
 	sb t1, 0(s1)
 	addi s1 s1 1
 	j go_start
 tens:
 	div t1 t5 t6  # t1/ 10
 	addi t1 t1 48
 	sb t1, 0(s1)
 	addi s1 s1 1 # десятки
 	
 	rem t1 t5 t6
 	addi t1 t1 48
 	sb t1, 0(s1)
 	addi s1 s1 1
 	j go_start

 	
go_start: 
 	addi s0 s0 1    
 	j start
 	
 stop:
 	sb zero(s1) #in end we get \0

 	pop(s1)
 	pop(s0)
 	pop(ra)
 	ret
 	
 	
 	
