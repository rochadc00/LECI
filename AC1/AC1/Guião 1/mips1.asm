	.data
frase:	.asciiz "Ola Mundo!"
	
	.globl main
	.text
main: 	la	$a0, frase	# $a0 -> endereço de frase
	addi	$v0, $0, 4	# $v0 = 0 + 4
	syscall			# print_str("Ola Mundo!")
	jr	$ra		# termina o programa