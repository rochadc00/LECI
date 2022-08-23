#####EX1_a)
# Mapa de registos
# res: $v0
# s: $a0
# *s: $t0
# digit: $t1 
	.data
str1:	.asciiz "123"
	.text
	.globl main

main:
	addi $sp,$sp,-4
	sw $ra,0($sp)
	la $a0,str1
	jal atoi
	lw $ra,0($sp)		
	addi $sp,$sp,4
	jr $ra			
	
atoi:
	li $v0,0		#res = 0
while:	
	lb $t0,0($a0)   	#argumento da função atoi-> char *s
	blt $t0,'0',endwhile	#while(*s >= '0' 
	bgt $t0,'9',endwhile	#&&  *s <= 9)
	sub $t1,$t0,'0'		#digit = *s - '0'
	addiu $a0,$a0,1		#*s++
	mul $v0,$v0,10		#t3 = 10*res
	add $v0,$v0,$t1		#res = v0(res*10) + digit (t2)
	j while	
endwhile:
	jr $ra			#acaba sub rotina
	