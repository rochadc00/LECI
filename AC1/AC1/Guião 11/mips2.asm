	.data
	.align 2
student:
	.space 4 # id_number
	.space 18 # first_name[]
	.space 15 # last_name[]
	.space 3
	.space 4 # grade
strmec:	.asciiz "\nN. Mec: "
strnome:.asciiz "\nNome: "
strvir:	.asciiz ","
strnota:.asciiz "\nNota: "
strpnome:.asciiz "\nPrimeiro nome: "
strsnome:.asciiz "\nSegundo nome: "
	.text
	.globl main
main:	la $t0,student
	
	la $a0,strmec
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	sw $v0,0($t0)
	
	la $a0,strpnome
	li $v0,4
	syscall
	
	addiu $a0,$t0,4
	la $a1,17
	li $v0,8
	syscall
	
	la $a0,strsnome
	li $v0,4
	syscall
	
	addi $a0,$t0,22
	la $a1,14
	li $v0,8
	syscall
	
	la $a0,strnota
	li $v0,4
	syscall
	
	li $v0,6
	syscall
	s.s $f0,40($s0)
	
	la $a0,strmec
	li $v0,4
	syscall
	
	lw $a0,0($t0)
	li $v0,1
	syscall
	
	la $a0,strnome
	li $v0,4
	syscall
	
	la $a0,4($t0)
	li $v0,4
	syscall
	
	la $a0,strvir
	li $v0,4
	syscall
	
	la $a0,22($t0)
	li $v0,4
	syscall
	
	la $a0,strnota
	li $v0,4
	syscall
	
	l.s $f12,40($t0)
	li $v0,2
	syscall
	
	li $v0,0
	jr $ra