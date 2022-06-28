	.data
	.text
	.globl main
	
main:

strcpy:
	li $t0,0	# int i = 0
	move $t1,$a0
	move $t2,$a1
do:	
	addu $t2,$t2,$t0	#  &src[i]
	lb $t2,0($t2)	
	addu $t1,$t1,$t0	# &dst[i]
	sb $t2,0($t1) 		# dst[i] = src[i];
	addiu $t0,$t0,1		#i++
	lb $t2,0($t0)
while:	
	bne $t2,'\0',do		# while(src[i++] != '\0'); 
	move $v0,$t1		#return dst; 
	jr $ra
