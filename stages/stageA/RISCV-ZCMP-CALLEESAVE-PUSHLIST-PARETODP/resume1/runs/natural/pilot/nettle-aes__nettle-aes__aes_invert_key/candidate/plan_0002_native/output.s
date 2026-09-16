	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcmp1p0"
	.file	"nettle-aes.c"
	.text
	.globl	aes_invert_key                  # -- Begin function aes_invert_key
	.p2align	1
	.type	aes_invert_key,@function
aes_invert_key:                         # @aes_invert_key
# %bb.0:
	cm.push	{ra, s0}, -32
	mv	s0, a0
	lw	a0, 0(a1)
	addi	a3, s0, 4
	addi	a2, a1, 4
	sw	a1, 12(sp)
	mv	a1, a3
	call	_nettle_aes_invert
	lw	a0, 12(sp)
	lw	a0, 0(a0)
	sw	a0, 0(s0)
	cm.popret	{ra, s0}, 32
.Lfunc_end0:
	.size	aes_invert_key, .Lfunc_end0-aes_invert_key
                                        # -- End function
	.ident	"clang version 22.1.8 (https://github.com/llvm/llvm-project.git ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"
	.section	".note.GNU-stack","",@progbits
