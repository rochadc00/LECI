		.data
std:			#Reservar espaço para dois students, aka student syze * tamanho do array
		.asciiz "Rei Eusebio"
		.space 	38	#Preencher o resto do espaço reservado
		.align 	2
		.word	12345
		.float	17.2
		.byte	'F'
		.space 3
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
		