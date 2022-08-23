	.data
	.align 2 ##dispensavel
stg:
	.word 72343
	.asciiz "Napoleão"
	.space 9 
	.asciiz "Bonaparte"
	.space 5
	.float 5.1

smec:	.asciiz "\nN. Mec: "
snome:	.asciiz "\nNome: "
scom:	.asciiz ","
snota:	.asciiz "\nNota: "
	.text
	.globl main

main:	la $t0,stg
	
	la $a0,smec		# \nN Mec:
	li $v0,4
	syscall
	
	lw $a0,0($t0)		#stg.id_number
	li $v0,36
	syscall
	
	la $a0,snome  		# \nNome: 
	li $v0,4
	syscall
	
	addiu $a0,$t0,22	#stg.last_name
	li $v0,4
	syscall
	
	la $a0,scom		# ","
	li $v0,4
	syscall
	
	addiu $a0,$t0,4		#stg.stg.first_name
	li $v0,4
	syscall
	
	la $a0,snota		# \nNota:
	li $v0,4
	syscall
	
	l.s $f12,40($t0) 	# stg.grade
	li $v0,2
	syscall
	
	jr $ra