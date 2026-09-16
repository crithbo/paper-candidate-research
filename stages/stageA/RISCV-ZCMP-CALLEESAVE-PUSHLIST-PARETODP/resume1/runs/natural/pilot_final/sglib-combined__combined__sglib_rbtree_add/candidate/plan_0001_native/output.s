	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcmp1p0"
	.file	"combined.c"
	.text
	.globl	sglib_rbtree_add                # -- Begin function sglib_rbtree_add
	.p2align	1
	.type	sglib_rbtree_add,@function
sglib_rbtree_add:                       # @sglib_rbtree_add
# %bb.0:
	cm.push	{ra}, -32
	sw	zero, 8(a1)
	sw	zero, 12(a1)
	sw	a0, 12(sp)
	call	sglib___rbtree_add_recursive
	lw	a0, 12(sp)
	lw	a0, 0(a0)
	sb	zero, 4(a0)
	cm.popret	{ra}, 32
.Lfunc_end0:
	.size	sglib_rbtree_add, .Lfunc_end0-sglib_rbtree_add
                                        # -- End function
	.hidden	sglib___rbtree_add_recursive
	.ident	"clang version 22.1.8 (https://github.com/llvm/llvm-project.git ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"
	.section	".note.GNU-stack","",@progbits
