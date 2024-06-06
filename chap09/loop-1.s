	.text
	.file	"loop-1.c"
	.globl	dax                             # -- Begin function dax
	.p2align	4, 0x90
	.type	dax,@function
dax:                                    # @dax
	.cfi_startproc
# %bb.0:
	testq	%rdx, %rdx
	jle	.LBB0_3
# %bb.1:
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movsd	(%rsi,%rax,8), %xmm1            # xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, (%rdi,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.LBB0_2
.LBB0_3:
	retq
.Lfunc_end0:
	.size	dax, .Lfunc_end0-dax
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
