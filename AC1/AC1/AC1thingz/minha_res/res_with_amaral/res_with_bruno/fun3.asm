	# Mapa de Registos
	# std 
	# n -> $a1
	#
	.data
std:	.asciiz "Rei Eusebio"	
	.space 38		# 50 bytes - length(Rei Eusebio) - 1 = 38
	.word 12345
	.float 17.2
	.byte 'F'
	.space 3
	
	.asciiz "Rainha Amalia"	
	.space 36		# 50 bytes - length(Rainha Amalia) - 1 = 36
	.word 23450
	.float 12.5
	.byte 'C'
	.space 3
	
x0:	.float 0.0
x2:	.float 2.0


	.eqv grade,56	
	.eqv print_float,2
	.eqv print_string,4
	
	.text
	.globl main

main:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $a0,std
	li $a1,2
	jal fun3		# fun3(std, 2)
	mov.s $f12,$f0	
	li $v0,print_float	# print_float(fun3(std, 2));
	syscall
	
	li $v0,-1		# return -1;
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra

fun3:
	l.s $f2,x0		# $f2 = 0.0
	li $t2,0		# int i = 0
	move $t0,$a0		# $t0 -> std
	move $t1,$a1		# $t1 -> n
	
for:	
	bge $t2,$t1,endf	#for(i=0; i < n; i++) 
	mul $t3,$t2,64		# $t3 = std[i]
	add $a0,$t0,$t3		# $a0 = std + i = &std - > std[i].name
	li $v0,print_string	# print_string(std[i].name); 
	syscall
	
	l.s $f12,grade($a0)	# std[i].grade
	li $v0,print_float	# print_float(std[i].grade);
	syscall
	
	add.s $f2,$f2,$f12	# sum += std[i].grade	
	addiu $t2,$t2,1		# i++
	j for
endf:
	l.s $f4,x2		# $f4 = 2.0
	div.s $f0,$f2,$f4	# return sum /2.0
	jr $ra