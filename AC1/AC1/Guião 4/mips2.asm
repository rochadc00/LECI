# Mapa de registos
# num: $t0
# p: $t1   
# *p: $t2
 	.data
 	.eqv	SIZE,20
	.eqv	read_string,8
	.eqv	print_int10,1
str:	.space	20
	.text
	.globl main
main: 	la $a0,str		# $a0=&str[0] (endereço da posição
				# 0 do array, i.e., endereço
 				# inicial do array)
 	li $a1,20 		# $a1=SIZE
 	li $v0,read_string
 	syscall 		# read_string(str,SIZE)
 	li $t0,0		# num=0; 
	la $t1,str 		# p = str;
while:				# while(*p != '\0')
 	lb   $t2, 		#
 	beq  $t2,0,endw 	# {
 	blt  $t2,'0',endif 	# if(str[i] >='0' &&
 	bgt  $t2,'9',endif 	# str[i] <= '9')
 	addi $t0,$t0,1 		# num++;
endif:
 	addiu $t1,$t1,1		# p++;
 	j     while		# }
endw: 	(...) 			# print_int10(num);
 	jr $ra 			# termina o programa 
