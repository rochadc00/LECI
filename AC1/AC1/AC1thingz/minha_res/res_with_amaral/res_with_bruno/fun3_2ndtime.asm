	.data
std:	.asciiz "Rei Eusebio"
	.space 38
	.word 12345
	.float 17.2
	.byte 'F'
	.space 3
	
	.asciiz "Rainha Amalia"
	.space 36
	.word 23450
	.float 12.5
	.byte 'C'
	.space 3
	
x0:	.float 0.0
x2:	.float 2.0

	.eqv print_float,2
	.eqv print_string,4
	.eqv grade,56

	.text
	.globl main
	
main:
	addiu $sp,$sp,-4	#reservar espaço na stack
	sw $ra,0($sp)
	
	la $a0,std		# argumento 0 = std
	li $a1,2		# argumento 1 = 2
	jal fun3		# 
	
	mov.s $f12,$f0
	li $v0,print_float
	syscall
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	li $v0,-1
	jr $ra


fun3:
	l.s $f2,x0
	li $t2,0		#int i = 0;
	move $t0,$a0
	move $t1,$a1
	
for:
	bge $t2,$t1,endf
	mul $t3,$t2,64
	add $t3,$t3,$t0		# &std = std + i
	move $a0,$t3
	li $v0,print_string
	syscall
	
	l.s $f12,grade($t3)
	li $v0,print_float
	syscall
	
	add.s $f2,$f2,$f12
	
	addiu $t2,$t2,1
	j for
	
endf:	
	l.s $f4,x2
	div.s $f0,$f2,$f4
	
	jr $ra
	
	