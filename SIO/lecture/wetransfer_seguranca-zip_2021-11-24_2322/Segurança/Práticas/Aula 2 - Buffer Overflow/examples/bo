	.file	"bo.c"
	.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"%s"
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	sub	esp, 24
	sub	esp, 8
	lea	eax, [ebp-12]
	push	eax
	push	OFFSET FLAT:.LC0
	call	__isoc99_scanf
	add	esp, 16
	leave
	ret
	.size	foo, .-foo
	.globl	main
	.type	main, @function
main:
	lea	ecx, [esp+4]
	and	esp, -16
	push	DWORD PTR [ecx-4]
	push	ebp
	mov	ebp, esp
	push	ecx
	sub	esp, 4
	mov	eax, ecx
	sub	esp, 12
	push	DWORD PTR [eax]
	call	foo
	add	esp, 16
	mov	eax, 0
	mov	ecx, DWORD PTR [ebp-4]
	leave
	lea	esp, [ecx-4]
	ret
	.size	main, .-main
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
