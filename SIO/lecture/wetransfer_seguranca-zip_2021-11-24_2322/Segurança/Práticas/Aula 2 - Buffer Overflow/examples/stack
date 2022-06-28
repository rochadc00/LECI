	.file	"stack.c"
	.intel_syntax noprefix
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	mov	eax, 3
	pop	ebp
	ret
	.size	foo, .-foo
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	push	DWORD PTR [ebp+8]
	call	foo
	add	esp, 4
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
