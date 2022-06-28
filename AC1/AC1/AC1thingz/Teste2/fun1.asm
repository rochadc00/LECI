	.data
x0:	.double	0.0
x1:	.double 2.0
	.text
	.globl fun1

fun1:	li	$t0,0		#k=0
	move	$t1,$a0		#p=a
	move	$t2,$a1
	sll	$t3,$t2,3	#n*8
	addu	$t4,$t3,$a0
	la	$t5,x0		#	CONVERTER UMA VARIAVEL
	la	$t6,x1		#	INICIALIZADA PREVIAMENTE COM la
	mtc1	$t5,$f4		#	e mtc1
	mtc1	$t6,$f6		#
for:	bge	$t1,$t4,endfor
	l.d	$f8,0($t1)
	div.d	$f10,$f8,$f6
if:	c.eq.d	$f10,$f4
	bc1t	else
	s.d	$a2,0($f8)
	addi	$a2,$a2,8
	j	endif
else:	add	$t0,$t0,1
endif:	addi	$t1,$t1,8
	j	for
endfor:	sub	$v0,$t2,$t0
	jr	$ra
	
	
	
	