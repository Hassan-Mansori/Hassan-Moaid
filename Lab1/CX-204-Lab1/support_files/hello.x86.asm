	.file	"hello.c"
	.text
	.section	.rodata
.LC0:
<<<<<<< HEAD:Lab1/CX-204-Lab1/support_files/hello.x86.asm
	.string	"<Hassan_MANSORI>"
=======
	.string	"<Your-Name>"
>>>>>>> refs/remotes/origin/main:CX-204-Lab1/support_files/hello.x86.asm
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
<<<<<<< HEAD:Lab1/CX-204-Lab1/support_files/hello.x86.asm
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
=======
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
>>>>>>> refs/remotes/origin/main:CX-204-Lab1/support_files/hello.x86.asm
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
