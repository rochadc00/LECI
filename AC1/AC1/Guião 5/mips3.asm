# Mapa de registos
# p: $t0
# *p: $t1
# lista+Size: $t2
 	.data
str1: 	.asciiz "; "
str2: 	.asciiz "\nConteudo do array:\n"
lista:	.word 8,-4, 3, 5, 124, -15, 87, 9, 27, 15	# a diretiva ".word" alinha num endereço
 							# múltiplo de 4
 	.eqv print_int10, 1
 	.eqv print_string, 4
 	.eqv SIZE, 10
 	.text
 	.globl main
main: 	la $a0, str2
	li $v0, print_string
	syscall						# print_string(...)
	
	la $t0,lista 					# p = lista
 	li $t2,SIZE 					#
 	sll $t2, $t2, 2					#multiplica por 4 cada int ocupa 4
 	addu $t2,$t0,$t2 				# $t2 = lista + SIZE;
while: 	bgeu $t0 ,$t2 , endwhile			# while(p < lista+SIZE) {

 	lw $t1,0($t1) 					# $t1 = *p;
 
 	
 	la $a0, $t1
 	li $v0, print_int10
 	syscall						# print_int10( *p );
 	
 	la $a0, str1
	li $v0, print_string
	syscall			 			# print_string(...);
 	addiu $t0, $t0, 1 				# p++; 
 	j while
endwhile: 						# }
 	jr $ra				 		# termina o programa 