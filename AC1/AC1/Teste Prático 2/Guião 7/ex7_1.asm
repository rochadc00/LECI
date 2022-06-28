	.data	
str:	.asciiz "Arquitetura de Computadores I"		
	.eqv print_int10,1	
	.text
	.globl main
	
main:	
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	la $a0,str		
	jal strlen		#strlen(str)
	move $a0,$v0		#valor returnado (len) é argumento
	li $v0,print_int10
	syscall			#print_int10(strlen(str));
	
	lw $ra,0($sp)
	addiu $sp,$sp,4		#repor espaço da pilha
	li $v0,0		#return 0;
	jr $ra

strlen:
	li $t0,0	# len = 0;

while:
	lb $t1,0($a0)	# t1 = char[0]
	addi $a0,$a0,1 # *s++;
	beqz $t1,endw	# while (*s++ != '\0')
	addi $t0,$t0,1	# len++;
	j while
endw:	
	move $v0,$t0	# return len;
	jr $ra
