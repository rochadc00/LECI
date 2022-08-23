	.data
st_array: .space 176	#44*4
k1:	.float	-20.0
k2:	.float	0.0
	.eqv	id,0
	.eqv	fn,4
	.eqv	ln,22
	.eqv	grd,40
	.eqv	read_int,5
	.eqv	read_str,8
	.eqv	read_float,6
	.text
	.globl main
main:	addiu	$sp,$sp,4
	sw	$ra,0($sp)
	
	la	$a0,st_array
	li	$a1,4		#number of students
	jal	read_data
	
	li	$v0,0	#return 0
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr 	$ra
	
#$a0: st
#$a1: ns
#$t0  i
read_data:
	move	$t0,$a0
	move	$t1,$a1
	li 	$t2,0		#i=0
for:	bge 	$t2,$t1,endf
	mul	$t3,$t2,44
	addu	$t3,$t3,$t0	#$t3=&st[i]
	li 	$v0,read_int
	syscall
	sw	$v0,id($t3)	#st[i].id_number = read_int();
	
	li	$v0,read_str
	addiu	$a0,$t3,fn	#$a0 = st[i].firstname
	li	$a1,18	
	syscall			# read_str(st[i].first_name, 18);
	
	li	$v0,read_str
	addiu	$a0,$t3,ln	#$a0 = st[i].last_name
	li	$a1,15	
	syscall			# read_str(st[i].last__name, 15);
	
	li	$v0,read_float
	syscall
	s.s	$f0,grd($t3)	#st[i].grade = read_float();
	addi	$t2,$t2,1	#se fosse um ponteiro era 44 (estrutura)							
	j 	for
endf:	jr 	$ra

#st: $a0
#ns: $a1
#media: $a2
#p: $t0
#pmax: $t1 (também pode estar no $v0)
#max_grade: $f0
#sum:	$f2

max:				# student *max(student *st, int ns, float *media) {
	l.s	$f0,k1		#max_grade = -20.0
	l.s	$f2,k2		#sum = 0.0
	mul	$t2,$a1,44
	addu	$t2,$a0,$t2	#$t2=st+ns
	move	$t0,$a0		#p = st
max_for:bge	$t0,$t2,max_endf
	l.s	$f4,grd($t0)	#$f4 = p->grade
	add.s	$f2,$f2,$f4	# sum = sum +  p->grade

	c.le.s 	$f4,$f0
	bc1t	endif
	mov.s	$f0,$f4		#max_grade=p->grade
	move	$t1,$t0		#pmax = p
	
endif:	
	addi	$t0,$t0,44	#p++
	j	max_for
max_endf:
	mtc1	$a1,$f0		#f0 já não vai ser utilizado
	cvt.s.w	$f0,$f0		#float(ns)
	div.s	$f0,$f2,$f0	#$f0=sum/(float)ns
	s.s	$f0,0($a2)	#*media = sum/float(ns)
	move	$v0,$t1		#return pmax (se tivesse no v0 ignorava-se este passo) 
	jr	$ra
	