	.data
	.text
	.globl	fun2
	
fun2:	addiu	$sp,$sp,-16
	sw	$ra,0($sp)	#ra
	sw	$s0,4($sp)	#n
	sw	$s1,8($sp)	#p
	sw	$s2,12($sp)	#k
	
	li	$s0,0		#n=0
	move	$s1,$a0		#s1 = p
	move	$s2,$a1		#s2 = k
	
while:	lb	$t0,0($s1)	#CARREGAR BYTE	
	beq	$t0,$s2,endw
	move	$a0,$s1
	move	$a1,$s2
	jal	funk
	add	$s0,$s0,$v0
	addiu	$s1,$s1,4
endw:	move	$v0,$s0
	
	lw	$ra,0($sp)
	lw	$s0,4($sp)
	lw	$s1,8($sp)
	lw	$s2,12($sp)
	addiu	$sp,$sp,16
	
	jr	$ra
	