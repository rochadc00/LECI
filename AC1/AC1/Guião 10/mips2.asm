.data
num1:	.double 0.5
num2:	.double 0.25
	.text
	.globl main
main:	addi $sp,$sp,-4
	sw $ra,0($sp)
	
	li $v0,7
	syscall
	
	mov.d $f12,$f0
	
	jal sqrt
	
	li $v0,3
	mov.d $f12,$f0
	syscall
	
	lw $ra,0($sp)
	addi $sp,$sp,4
	jr $ra
	
	
sqrt:	li $t0,1
	mtc1 $t0,$f4
	cvt.d.w $f4,$f4
	sub $t0,$t0,1
	mtc1 $t0,$f6
	
	c.le.d $f12,$f6
	bc1f do
	mov.d $f0,$f6
	jr $ra
do:	mov.d $f6,$f4
	div.d $f8,$f12,$f4
	add.d $f8,$f8,$f4
	l.d $f10,num1
	mul.d $f4,$f10,$f8
	addi $t0,$t0,1
	bge $t0,25,enddo
	c.eq.d $f4,$f6
	bc1t enddo
	
	j do
enddo:	mov.d $f0,$f4
	jr $ra