.macro push(%x)
	addi	sp, sp, -4
	sw	%x, (sp)
.end_macro

.macro pop(%x)
	lw	%x, (sp)
	addi	sp, sp, 4
.end_macro

.macro push_double(%x)
	addi	sp, sp, -8
	fsd 	%x, (sp)
.end_macro 

.macro pop_double(%x)
	fld 	%x, (sp)
	addi	sp, sp, 8
.end_macro 