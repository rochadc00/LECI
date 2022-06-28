	.data
	.text
	# p = $s0 
	# k = $s1
	# n = $s2
	.globl fun2

fun2:
	addiu $sp,$sp,-16
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	
	move $s0,$a0		# p = $s0
	move $s1,$a1		# k = $s1
	li $s2,0		# int n=0
	
while:
	lw $t0,0($s0)		
	beq $t0,$s1,endw	# while ( *p != k )
	move $a0,$s0		# argumento 0 = $s0
	move $a1,$s1		# argumento 1 = $s1
	jal funk		# funk(*p, k)
	addu $s2,$s2,$v0	# n = n + funk(*p, k); 
	addiu $s0,$s0,4		# p++
	j while
endw:
	move $v0,$s2		# return n
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	addiu $sp,$sp,16
	jr $ra