	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcmp1p0"
	.file	"combined.c"
	.text
	.globl	sglib_rbtree_it_next            # -- Begin function sglib_rbtree_it_next
	.p2align	1
	.type	sglib_rbtree_it_next,@function
sglib_rbtree_it_next:                   # @sglib_rbtree_it_next
# %bb.0:
	cm.push	{ra, s0}, -16
	mv	s0, a0
	call	sglib__rbtree_it_compute_current_elem
	lw	a0, 0(s0)
	cm.popret	{ra, s0}, 16
.Lfunc_end0:
	.size	sglib_rbtree_it_next, .Lfunc_end0-sglib_rbtree_it_next
                                        # -- End function
	.ident	"clang version 22.1.8 (https://github.com/llvm/llvm-project.git ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"
	.section	".note.GNU-stack","",@progbits
