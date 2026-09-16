	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcmp1p0"
	.file	"nettle-aes.c"
	.text
	.globl	aes_invert_key                  # -- Begin function aes_invert_key
	.p2align	1
	.type	aes_invert_key,@function
aes_invert_key:                         # @aes_invert_key
# %bb.0:
	cm.push	{ra, s0-s1}, -16
	cm.mvsa01	s1, s0
	lw	a0, 0(s0)
	addi	a1, s1, 4
	addi	a2, s0, 4
	call	_nettle_aes_invert
	lw	a0, 0(s0)
	sw	a0, 0(s1)
	cm.popret	{ra, s0-s1}, 16
.Lfunc_end0:
	.size	aes_invert_key, .Lfunc_end0-aes_invert_key
                                        # -- End function
	.ident	"clang version 22.1.8 (https://github.com/llvm/llvm-project.git ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"
	.section	".note.GNU-stack","",@progbits
