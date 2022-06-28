		.data
x1:		.float 2.0
		.eqv name,0
		.eqv num,52
		.eqv grade,56
		.eqv type,60
		.text
		.globl fun3

fun3:		la	$t5,x1
		l.s	$f6,0($t5)
		mtc1	$0,$f4		#sum->$f4
		li	$t0,0		#i = 0
		move	$t1,$a1		#n
		mul	$t1,$t1,64	#n*61
		move	$t2,$a0		#*std
for:		bge	$t0,$t1,endfor	#for
		addu	$t3,$t0,$t2	#&std[i]
		addiu	$a0,$t3,name	#carregar valor de std[i].name -> addiu quando é print string
		li	$v0,4		#print_string
		syscall			
		l.s	$f12,grade($t3)	#carregar valor de std[i].grade
		li	$v0,2
		syscall
		add.s	$f4,$f4,$f12	#sum += std[i].grade
		addi	$t0,$t0,64	#i++
		j	for
endfor:		div.s	$f0,$f4,$f6

		jr	$ra		