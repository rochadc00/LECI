	.data
	
	.text
	.globl main
main:	ori	$t0, $0, 3	# $t0 = 3 
	ori	$t2, $0, 8	# $t2 = 8
	add	$t1, $t0, $t0	# $t1 = $t0 + $t0 = 3 + 3 = 2 * 3
	add	$t1, $t1, $t2	# $t1 = $t1 + $t2 = y = 2 * 3 + 8
	jr 	$ra		# fim do programa