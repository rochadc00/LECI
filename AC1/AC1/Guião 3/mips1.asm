#Mapa de registos:
#  $t0 - soma
#  $t1 - value
#  $t2 - i
	.data
str1:	.asciiz	"Introduza um numero: "
str2:	.asciiz	"Valor ignorado\n"
str3:	.asciiz	"A soma dos positivos e: "
	.eqv print_string,4
	.eqv read_int,5
	.text
	.globl main
main:	li  $t0,0			#soma = 0;
	li  $t2,0			#i  =  0;

for:	bge $t2,5,endfor		#while(i<5) {
	
	
	la  $a0,str1		  	##instrução virtual, decomposta pelo
				  	##assembler em 2 instrucoes nativas
	ori $v0, $0, print_string	## $v0 = 4 
	syscall				##print_string(str1)
	
	ori $v0, $0, read_int
	syscall				##valor lido e retornado em $v0
	or $t1,$v0,$0			##$t1 = read_int()
	
if:	ble $t1,$0,else			#  if (value > 0)
	add $t0,$t0,$t1			#   soma += value;
	j endif
	
else:   				#  else
					#  print_string("Valor ignorado\n");
	la  $a0,str2		  	##instrução virtual, decomposta pelo
				  	##assembler em 2 instrucoes nativas
	ori $v0, $0, print_string	## $v0 = 4 
	syscall				##print_string(str2)
					
					
endif:  addi $t2,$t2,1			#  i++
	j    for			#}
endfor:
					#print_string("A soma dos positivos e: ");
	la  $a0,str3		  	##instrução virtual, decomposta pelo
				  	##assembler em 2 instrucoes nativas
	ori $v0, $0, print_string	## $v0 = 4
	syscall				##print_string(str3)
				
					#print_int10(soma);
	move $a0, $t0			## Como print_int dá print do $a0, 
					##temos que guardar lá o valor soma	
	ori $v0, $0, 1			## a system call print_int10() e
					##identificada com o numero 1 (ver tabela de instrucoes)
	syscall				## chamada ao syscall "print_int10()"

	jr $ra