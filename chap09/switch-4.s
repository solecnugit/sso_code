	.text
	.file	"switch-4.c"
	.globl	f                               # -- Begin function f
	.p2align	4, 0x90
	.type	f,@function
f:                                      # @f
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
                                        # kill: def $edi killed $edi def $rdi
	leal	-2(%rdi), %eax
	cmpl	$6, %eax
	ja	.LBB0_5
# %bb.1:
	jmpq	*.LJTI0_0(,%rax,8)
.LBB0_2:
	addl	$1, %edi
                                        # kill: def $edi killed $edi killed $rdi
	callq	g
	movl	%eax, %edi
	jmp	.LBB0_6
.LBB0_3:
	addl	$100, %edi
                                        # kill: def $edi killed $edi killed $rdi
	callq	k
	movl	%eax, %edi
	jmp	.LBB0_6
.LBB0_5:
	addl	$10, %edi
	jmp	.LBB0_6
.LBB0_4:
	addl	$3, %edi
.LBB0_6:
	movl	%edi, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	f, .Lfunc_end0-f
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI0_0:
	.quad	.LBB0_2
	.quad	.LBB0_2
	.quad	.LBB0_3
	.quad	.LBB0_5
	.quad	.LBB0_5
	.quad	.LBB0_5
	.quad	.LBB0_4
                                        # -- End function
	.ident	"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
