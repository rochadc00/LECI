	# Mapa de registos
	# p = $a0, $s0
	# k = $a1, $s1
	# n = $s2
	.data
	.text
	.globl fun2

fun2:	
	addiu $sp,$sp,-16	# reservar espaço na stack
	sw $ra,0($sp)		# $ra
	sw $s0,4($sp)		# p
	sw $s1,8($sp)		# k
	sw $s2,12($sp)		# n
	 
	li $s2,0		# int n=0;
	move $s0,$a0		# $s0 -> argumento de entrada 0 (*p)
	move $s1,$a1		# $s1 -> argumento de entrada 1 (k)
			
while:
	lw $t0,0($s0)		# $t0 = *p
	beq $t0,$s1,endw	# while ( *p != k )

	move $a0,$t0		# *p (conteudo) -> argumento 0 ($a0)
	move $a1,$s1		# k -> argumento 1 ($a1)
	jal funk		# funk(*p, k);
	
	addu $s2,$s2,$v0	# n = n + funk(*p, k);
	addiu $s0,$s0,4		# p++; 
endw:	
	move $v0,$s0		# return n;
	
	lw $ra,0($sp)		
	lw $s0,4($sp)		
	lw $s1,8($sp)		
	lw $s2,12($sp)		
	addiu $sp,$sp,16	
	
	jr $ra