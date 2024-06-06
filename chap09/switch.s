	.text
	.file	"switch.c"
	.globl	f                               # -- Begin function f
	.p2align	4, 0x90
	.type	f,@function
f:                                      # @f
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	leal	-2(%rdi), %ecx
	movl	$10, %eax
	cmpl	$6, %ecx
	ja	.LBB0_2
# %bb.1:
	movslq	%ecx, %rax
	movl	.Lswitch.table.f(,%rax,4), %eax
.LBB0_2:
	addl	%edi, %eax
	retq
.Lfunc_end0:
	.size	f, .Lfunc_end0-f
	.cfi_endproc
                                        # -- End function
	.type	.Lswitch.table.f,@object        # @switch.table.f
	.section	.rodata,"a",@progbits
	.p2align	2
.Lswitch.table.f:
	.long	1                               # 0x1
	.long	10                              # 0xa
	.long	2                               # 0x2
	.long	10                              # 0xa
	.long	10                              # 0xa
	.long	10                              # 0xa
	.long	3                               # 0x3
	.size	.Lswitch.table.f, 28

	.ident	"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
