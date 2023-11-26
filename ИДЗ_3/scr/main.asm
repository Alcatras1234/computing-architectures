.include "macros.asm"
.eqv NAME_SIZE 256 #size bufer for file name
.eqv TEXT_SIZE  512 #size buffer for text
.eqv TEXT_NEW 512
.eqv ANSWER_SIZE 127

    .data
	prompt:         .asciz "Input file path: "     
	er_name_mes:    .asciz "Incorrect file name\n"
	er_read_mes:    .asciz "Incorrect read operation\n"
	file_name: .space NAME_SIZE #name file where we get information
	strbuf: .space TEXT_SIZE #buf for text
	lettersbuf: .space 10240 #buf 
	file_name_save: .space NAME_SIZE #name file where we get information
	answer: .space 128
.global file_name
.align 2
.text
	la s0 file_name
	la s1 strbuf
	la s2 lettersbuf
	la s3 answer
	
	 print_str("Input file path: "  )

	 read_str(file_name, NAME_SIZE) #read file name
	 read_file(s0, s1) #strbuf have str into file
	 change_con(s1, s2)
	  print_str("Input file path where save the new str: "  )
	 read_str(file_name_save, NAME_SIZE) #read file name
	 strlen(s2) # get str length
	 write_file(file_name_save, s2, s10) #write file
	 print_str("Print result in console&? (Y/N): " )
	 read_str(answer, ANSWER_SIZE)
	 li t5, 'Y'
	 lb t1(s3)
	 beq t1 t5 pr_result
	 j exit
pr_result:
	print_str("\nresult: ")
	 print_buf(lettersbuf)
exit:
	 li a7, 10
	 ecall
	 
	  
	

