	.data
x0:	.double 2.0		#constantes tipo double
x1:	.double 0.0
	.text
	#a $a0
	#N $a1
	#b $a2
	#k $t0 
	#p $t1
	.globl fun1
fun1:	li $t0,0             #int k = 0
	
	la $t3,x0	     # guardar as labels de tipo double
	la $t4,x1
	mtc1.d $t4,$f2	     # mover para o coproc1 os doubles
	mtc1.d $t5,$f4       #	que são constantes
	
	move $t1,$a0  	     # p = a
	sll $a1,$a1,3	     #N = 8, ponteiro de double, 8 em 8
	add $t2,$a0,$a1      # a + N
for:		
	bge $t1,$t2,endf     # for( p = a; p < (a + N); p++)
if:
	l.d $f6,0($t1)	     # como é um adivisão de floats/doubles
			     # não pode acontecer no coproc0
			     # logo temos que fazer load double para um f
	div.d $f8,$f6,$f2    # *p / 2.0

	c.eq.d $f8,$f4	     # compare if equal
	bc1t else	     # se true estiver a 1, salta para o else
	mtc1.d $a2,$f10	     # endereço de b guardado em $f10
	s.d  $f10,$f6	     # *b = *p;
	addiu $a2,$a2,8      # *b++;
	j endif
else:
	addiu $t0,$t0,1	     #k++
endif:
	addiu $t1,$t1,8	     #p++
	j for
endf:   
        sub $v0,$a1,$t0	     # return (N-k)
	jr $ra
