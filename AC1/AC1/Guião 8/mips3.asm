#####EX1_c) 
# Mapa de registos
# res: $t3
# s: $a0
# *s: $t0
# digit: $t1 
	.data
str1:	.asciiz "101101 dias até ao fim do semestre"
	.eqv print_int10,1
	.text
	.globl main

main:
	addi $sp,$sp,-4
	sw $ra,0($sp)
	la $a0,str1
	jal atoi
	
	move $a0,$v0
	li $v0,print_int10
	syscall
	
	lw $ra,0($sp)		
	addi $sp,$sp,4
	
	jr $ra			
	
atoi:
	li $t3,0		#res = 0
while:	
	lb $t0,0($a0)   	#argumento da função atoi-> char *s
	blt $t0,'0',endwhile	#while(*s >= '0'
	bgt $t0,'9',endwhile	#&&  *s <= 1)
	sub $t1,$t0,'0'		#digit = *s - '0'
	addiu $a0,$a0,1		#*s++
	mul $t3,$t3,2		#t3 = 2*res
	add $t3,$t3,$t1		#res = v0(res*10) + digit (t2)
	j while	
endwhile:
	move $v0,$t3
	jr $ra			#acaba sub rotina
	