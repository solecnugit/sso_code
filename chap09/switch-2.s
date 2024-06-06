	.text
	.file	"switch-2.c"
	.globl	f                               # -- Begin function f
	.p2align	4, 0x90
	.type	f,@function
f:                                      # @f
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edi, %eax
	addl	$-1, %eax
	movl	$.Lstr.14, %edi
	cmpl	$6, %eax
	ja	.LBB0_2
# %bb.1:
	cltq
	movq	.Lswitch.table.f(,%rax,8), %rdi
.LBB0_2:
	callq	puts
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	f, .Lfunc_end0-f
	.cfi_endproc
                                        # -- End function
	.type	.Lstr,@object                   # @str
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr:
	.asciz	"Sunday"
	.size	.Lstr, 7

	.type	.Lstr.8,@object                 # @str.8
.Lstr.8:
	.asciz	"Saturday"
	.size	.Lstr.8, 9

	.type	.Lstr.9,@object                 # @str.9
.Lstr.9:
	.asciz	"Friday"
	.size	.Lstr.9, 7

	.type	.Lstr.10,@object                # @str.10
.Lstr.10:
	.asciz	"Thursday"
	.size	.Lstr.10, 9

	.type	.Lstr.11,@object                # @str.11
.Lstr.11:
	.asciz	"Wednesday"
	.size	.Lstr.11, 10

	.type	.Lstr.12,@object                # @str.12
.Lstr.12:
	.asciz	"Tuesday"
	.size	.Lstr.12, 8

	.type	.Lstr.13,@object                # @str.13
.Lstr.13:
	.asciz	"Monday"
	.size	.Lstr.13, 7

	.type	.Lstr.14,@object                # @str.14
.Lstr.14:
	.asciz	"error"
	.size	.Lstr.14, 6

	.type	.Lswitch.table.f,@object        # @switch.table.f
	.section	.rodata,"a",@progbits
	.p2align	3
.Lswitch.table.f:
	.quad	.Lstr.13
	.quad	.Lstr.12
	.quad	.Lstr.11
	.quad	.Lstr.10
	.quad	.Lstr.9
	.quad	.Lstr.8
	.quad	.Lstr
	.size	.Lswitch.table.f, 56

	.ident	"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
