	#Mapa de Registos
	# a = $a0
	# N = $a1
	# b = $a2
	# k = $t0
	# p = $t1
	.data
x0:	.double 0.0
x2:	.double 2.0
	.text
	.globl fun1

fun1:
	li $t0,0		#int k = 0
	move $t1,$a0		# p = a	
	move $t2,$a2		# $t2 = $a2
	sll $t2,$t2,3		# N * 8 (ponteiro de double)
	addu $t3,$a0,$t2	# (a + N)
	
for:
	bge $t1,$t3,endf
	l.d $f2,0($t1)
	l.d $f4,x2
	div.d $f6,$f2,$f4
	l.d $f8,x0
if:
	c.eq.d $f6,$f8
	bc1t else
	s.d $f2,0($a2)
	addiu $a2,$a2,8
else:
	addiu $t0,$t0,1
endif:
	addiu $t1,$t1,8
	j for
endf:
	sub $v0,$a1,$t0
	jr  $ra