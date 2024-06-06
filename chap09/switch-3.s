	.text
	.file	"switch-3.c"
	.globl	f                               # -- Begin function f
	.p2align	4, 0x90
	.type	f,@function
f:                                      # @f
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edi, %eax
	cmpl	$8, %edi
	je	.LBB0_5
# %bb.1:
	cmpl	$4, %eax
	je	.LBB0_4
# %bb.2:
	cmpl	$2, %eax
	jne	.LBB0_6
# %bb.3:
	addl	$1, %eax
	movl	%eax, %edi
	callq	g
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.LBB0_5:
	.cfi_def_cfa_offset 16
	addl	$3, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.LBB0_4:
	.cfi_def_cfa_offset 16
	addl	$2, %eax
	movl	%eax, %edi
	callq	h
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.LBB0_6:
	.cfi_def_cfa_offset 16
	addl	$10, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	f, .Lfunc_end0-f
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
