		.data
x1:		.float 2.0
std:			#Reservar espaço para dois students, aka student syze * tamanho do array
		.asciiz "Rei Eusebio"
		.space 	38	#Preencher o resto do espaço reservado
		.align 	2
		.word	12345
		.float	17.2
		.byte	'F'
		.align	2
		.asciiz "Rainha Amália"
		.space 36
		.align 2
		.word  23450
		.float 12.5
		.byte  'C'
		.text
		.globl main
main:		addiu	$sp,$sp,-4
		sw	$ra,0($sp)
		la	$a0,std		#passar parametros para as funcs
		li	$a1,2		#passar parametros para as funcs
		jal	fun3
		mov.s	$f12,$f0	#mover de f0, para o argumento de print_float
		li	$v0,2	
		syscall			#Print Float
		li	$v0,-1
		lw	$ra,0($sp)
		addiu	$sp,$sp,4	#repor a stack
		jr	$ra
		
		
fun3:		la	$t5,x1
		mtc1	$t5,$f6
		mtc1	$0,$f4		#sum->$f4
		li	$t0,0		#i = 0
		move	$t1,$a1		#n
		mul	$t1,$t1,61	#n*61
		move	$t2,$a0		#*std
for:		bge	$t0,$t1,endfor	#for
		addu	$t3,$t0,$t2	#&std[i]
		lw	$a0,name($t3)	#carregar valor de std[i].name
		li	$v0,4		#print_string
		syscall			
		l.s	$f12,grade($t3)	#carregar valor de std[i].grade
		li	$v0,2
		syscall
		add.s	$f4,$f4,$f12	#sum += std[i].grade
		addi	$t0,$t0,61	#i++
		j	for
endfor:		div.s	$f0,$f4,$f6

		jr	$ra		
		
		