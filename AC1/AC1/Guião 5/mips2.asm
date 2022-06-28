				# i: $t0
				# lista: $t1
				# lista + i: $t2
 	.data
 	.eqv SIZE,5
str1: 	.asciiz "\nIntroduza um numero: "
 	.align ?
lista:	.space ?? 		# SIZE * 4
 	.eqv read_int,...
 	.text
 	.globl main
main: li $t0,0 			# i = 0;
while: b?? ... 			# while(i < SIZE) {
 (...) 				# print_string(...);
 li $v0,read_int
 syscall 			# $v0 = read_int();
 la $t1,lista # $t1 = lista (ou &lista[0])
 sll $t2,$t0,.. #
 addu $t2,... # $t2 = &lista[i]
 sw $v0,... # lista[i] = read_int();
 addi $t0,... # i++
 (...) # }
endw: jr $ra # termina programa 