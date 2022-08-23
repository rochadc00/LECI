	.data
	
	.text
	.globl main
main:	ori $v0, $0, 5		# a system call read_int() e identificada
				#com o numero 5 (ver tabela de instrucoes)
	syscall			# a system call read_int() e chamada
	or  $t0, $0, $v0 	# $t0 =  $v0 = valor lido do teclado
				#(valor de x pretendido)
	ori $t2, $0, 8		# $t2 = 8
	add $t1, $t0, $t0	# $t1 = $t0 + $t0 = x + x = 2 * x
	sub $t1, $t1, $t2	# $t1 ? $t1 + $t2 = y = 2 * x - 8
				# ($t1 tem o valor calculado de y)
	or  $a0, $0, $t1	# $a0 = y
	ori $v0, $0, 1		# a system call print_int10() e
				#identificada com o numero 1 (ver tabela de instrucoes)
	syscall			# chamada ao syscall "print_int10()"	
				#
	ori $v0, $0, 34		# a system call print_int16() e
				#identificada com o numero 34 (ver tabela de instrucoes
	syscall			# chamada ao syscall "print_int16()"
				#
	ori $v0, $0, 36		# a system call print_intu10() e
				#identificada com o numero 36 (ver tabela de instrucoes)
	syscall			# chamada ao syscall "print_intu10()"
	jr $ra			# termina o programa
