	.text
	.globl toascii
	
toascii:	addiu $v0, $a0, '0'
if:	bge $v0, '9', endif
	addi $v0, $v0, 7
endif:	jr $ra