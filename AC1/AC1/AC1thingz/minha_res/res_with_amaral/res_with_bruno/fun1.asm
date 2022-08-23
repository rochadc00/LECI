	#Mapa de registos
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
	li $t0,0		# int k = 0;
	move $t1,$a0		# p = a
	sll $t2,$a1,3		# N * 8
	addu $t3,$a0,$t2	# $t3 = a + N
	
for:
	bge $t1,$t3,endf	# for( p = a; p < (a + N); p++)
	l.d $f2,0($t1)		# $f2 = *p
	l.d $f4,x2		# $f4 = 2.0
	div.d $f6,$f2,$f4	# $f6 = (*p / 2.0)
if:	
	l.d $f8,x0		# $f8 = 0.0
	c.eq.d $f6,$f8
	bc1t else
	s.d $f6,0($a2)		# *b = *p;
	addiu $a2,$a2,8		# *b++
	j endif
else:
	addiu $t0,$t0,1		# k++;
endif:
	addiu $t1,$t1,8		# p++	
	j for			
endf:
	sub $v0,$a1,$t0		# return (N - k)
	jr $ra			