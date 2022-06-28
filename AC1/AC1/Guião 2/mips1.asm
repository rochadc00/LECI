	.data
	.text 
	.globl main

main:	ori  $t0, $0, 0x0F1E		# susbtituir val_1 val_2 pelos
	ori  $t1,$0, 0xA3E4		#valores de entrada desejados
	and  $t2, $t0, $t1		# $t2 = $t0 & $t1 (and bit a bit)
	or   $t3, $t0, $t1		# $t3 = $t0 | $t1 (or bit a bit)
	nor  $t4, $t0, $t1		# $t4 = !($t0 | $t1) (nor bit a bit)
	xor  $t5, $t0, $t1		# $t5 = $t0 ^ $t1 (xor bit a bit)
	
	# Experimentar os valores:
	# val_1 = 0x1234, val_2 = 0x000F
	# val_1 = 0x1234, val_2 = 0xF0F0
	# val_1 = 0x5C1B, val_2 = 0xA3E4 
	
	xori $t1, $t0, 0xFFFFFFFF	# negação bit a bit
	nor  $t1, $0, $t0		# negação bit a bit >>>
	
	# Experimentar o valor
	# val = 0x0F1E
	# val = 0x0614
	# val = 0xE543
	
	jr  $ra			# fim do programa
	
	
	
	