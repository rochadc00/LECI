	.data
str:	.asciiz "ITED - orievA ed edadisrevinU"
	.eqv print_str,4
	.text
	.globl main
	
main:	
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $a0,str
	jal strrev
	move $a0,$v0
	li $v0,print_str
	syscall
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	li $v0,0		#return 0;
	jr $ra

strrev:
	addiu $sp,$sp,-16
	sw $ra,0($sp)	#ra
	sw $s0,4($sp)   #v0
	sw $s1,8($sp)   #p1
	sw $s2,12($sp)  #p2
	
	move $s0,$a0	#registo callee saved
	move $s1,$a0	# p1 = str
	move $s2,$a0	# p2 = str
	
while1:
	lb $t0,0($s2)	# t1 = *p2
	beqz $t0,endw1	# *p2 != '\0'
	addiu $s2,$s2,1	# p2++;
	j while1
endw1:
	addiu $s2,$s2,-1 # p2--;
	
while2:
	bge $s1, $s2,endw2
	move $a0,$s1
	move $a1,$s2
	jal exchange
	addiu $s1,$s1,1		#p1++
	addiu $s2,$s2,-1	#p2-- 
	j while2
endw2:
	move $v0,$s0
	lw $ra,0($sp)	
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	addiu $sp,$sp,16
	jr $ra
exchange:
	lb $t0,0($a0) # t0 = *c1
	lb $t1,0($a1) # t1 = *c2
	sb $t0,0($a1) # *c1 = t0
	sb $t1,0($a0) # *c2 = t1
	jr $ra