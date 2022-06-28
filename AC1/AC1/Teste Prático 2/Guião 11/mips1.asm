	.data
	# static student stg = {72343, "Napoleao", "Bonaparte", 5.1}; 
stg:	.word 72343
	.asciiz "Napoleao" # 18 - 8 bytes (Napoleao) - 1 byte ('\0') = 9 bytes
	.space 9
	.asciiz "Bonaparte" # 15 -  9 bytes(Bonaparte) - 1 byte ('\0') = 5 bytes
	.space 5
	.space 3 
	.float 5.1
	.eqv print_intu10,1
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv print_float,2 
	.text
	.globl main
main:
	la $t0,stg
	
	lw $a0,0($t0)
	li $v0,print_intu10
	syscall
	
	addi $a0, $t0, 22	# é dado o address da string que é "stg + i" 
	li $v0, print_string
	syscall
	
	addi $a0, $t0, 4	
	li $v0, print_string
	syscall
	
	l.s $f12, 40($t0)
	li $v0,print_float
	syscall
	