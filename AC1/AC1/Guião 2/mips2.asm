	.data
	.text
	.globl main

main:	li $t0, 0x862A5C1B	#instrução virtual (decomposta
				#em duas instruções nativas)
	
	# Experimentar valores:
	# (0x12345678, 1)
	# (0x12345678, 4)
	# (0x12345678, 16)
	# (0x862A5C1B, 2)
	# (0x862A5C1B, 4) 			
	
	
	sll $t2, $t0, 4		# shift left logical 
				#(multiplição por 2^constante)
		
	srl $t3, $t0, 4		# shift right logical 
				#(divisão por 2^constante)
			
	sra $t4, $t0, 4		# shift right arithmetic
				# (divisão por 2^constante, mantendo o sinal)
	
	#-----------------------# alinea d)
				
	li $t0, 0x00000005	#instrução virtual (decomposta
				#em duas instruções nativas)
	
	# Experimentar 2,4,5,...
				
	srl $t5, $t0, 1		# deslocamento à direita de $t0
				# $t5 = $t0 >> 1
							
	xor $t1,$t0, $t5	# $t1 = $t0 ^ ($t5 = $t0 >> 5)
	
	
	#-----------------------# alinea e)
	
	li $t0, 0x00000003	#instrução virtual (decomposta
				#em duas instruções nativas)
	or $t1, $0, $t0		# num = gray
				
	
	srl $t3, $t1, 4		# num = gray
	xor $t1, $t1 , $t3	# (num >> 4)
	srl $t3, $t1, 2		# num = num ^ (num >> 4)
	xor $t1, $t1 , $t3	# (num >> 2)
	srl $t3,$t1, 1		# num = num ^ (num >> 2)
	xor $t1, $t1 , $t3	# (num >> 1)
	
	or $t2, $0, $t1		# num = num ^ (num >> 1)
				
	
	
	jr  $ra			# fim do programa