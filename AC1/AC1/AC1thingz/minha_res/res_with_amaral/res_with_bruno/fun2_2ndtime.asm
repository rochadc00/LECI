	.data
	.text
	.globl fun2
	
fun2:	
	addiu $sp,$sp,-16
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	
	li $s2,0		#int n = 0;
	move $s0,$a0			
	move $s1,$a1		

while:	
	lw $t0,0($s0)
	beq $t0,$s1,endw
	move $a0,$t0
	move $a1,$s1
	jal funk
	addu $s2,$s2,$v0
	addiu $s0,$s0,4		#p++
		
endw:
	move $v0,$s2
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	addiu $sp,$sp,16
	jr $ra