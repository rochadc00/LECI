	.data
	.eqv SIZE, 3			##define SIZE 3
	.eqv print_str, 4
	.eqv print_char, 11
	
str1:	.asciiz	"Array"
str2:	.asciiz	"de"
str3:	.asciiz	"ponteiros"	
arr:	.word str1, str2, str3
	# .space 12		caso o array não fosse inicializado 
	# .align também seria necessário porque o .word faz o alinhamento	
	.text
	.globl main
main:					#void main(void)
					#{				
	li $t0, 0			## $t0 -> # int i; i = 0
					#	int i;
	
for: 	bge $t0, SIZE, endfor		# while (i < SIZE) 
	
	la $t1, arr
	sll $t2, $t0, 2
	addu $t2, $t1, $t2		#t2 é o endereço de array[i]
	lw $a0, 0($t2)			#a0 = array[i] 
	li $v0, print_str
	syscall				# print_string(array[i]);
	
	li $a0, '\n'
	li $v0, print_char
	syscall				#print_char
	
	addi $t0, $t0, 1		#i++
	j for			
endfor:
	jr $ra				#}
					
					 

