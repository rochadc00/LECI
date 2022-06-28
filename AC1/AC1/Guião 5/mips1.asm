	.data
	.eqv SIZE, 5			##define SIZE 5
	.eqv print_str, 4
	.eqv read_int, 5
	.text
	.globl main
main:					#void main(void)
					#{
	.data
str:	.asciiz	"\nIntroduza um numero: "
	.align 2
lista:	.space 20			##4(bytes--> cada elemento do array ocupa) * 5 (tamanho) 
					#	 static int lista[SIZE]; // declara um array de inteiros
					#				 // residente no segmento de dados
	.text				
	li $t0, 0			## $t0 -> # int i; i = 0
					#	int i;
for: 	bge $t0, SIZE, endfor		# 	while (i < SIZE) 
					#	{
	la $a0, str
	li $v0, print_str
	syscall				# 		print_string("\nIntroduza um numero: ");
	
	li $v0, read_int		
	syscall				#		int temp = read_int();
	sll $t1, $t0, 2			#		int temp1 = i * 4;
	la $t2, lista
	addu $t1, $t2, $t1		#		int temp2 = temp1 + &(lista[0]);	
	sw $v0, 0($t1)			# 		lista[i] = read_int();
	addi $t0, $t0, 1		#		i++;
	j for				#	}
endfor:
	jr $ra				#}
					
					 

