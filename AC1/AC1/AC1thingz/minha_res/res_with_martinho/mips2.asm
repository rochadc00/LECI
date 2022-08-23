	.data
	.text
	# p = $s0
	# k = $s1
	# n = $s2
	.globl funk

funk:

fun2:
	addiu $sp,$sp,-12
	sw $ra,0($sp) #ra
	sw $s0,4($sp) #p
	sw $s1,8($sp) #n
	
	li $s2,0	#int n=0;
	move $t0,$s2	# como os valores vão ser alterados
	move $t1,$s0	# foram guardados em registos do tipo t
while:
	beq $s0,$s1,endw	#while ( *p != k )
	move $a0,$s0		# *p passa a argumento 0
	move $a1,$s1		# k passa a argumento 1
	jal funk		# funk(*p, k);
			
	add $t0,$t0,$v0		#n = n + funk(*p, k); 
	
	addiu $t1,$t1,1		#p++;
endw:			
	move $v0,$s1		#return n; 
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	addiu $sp,$sp,12
	jr $ra