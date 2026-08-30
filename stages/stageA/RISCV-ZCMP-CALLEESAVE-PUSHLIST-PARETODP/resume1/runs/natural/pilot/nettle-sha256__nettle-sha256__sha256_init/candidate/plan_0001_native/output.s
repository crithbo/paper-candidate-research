	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcmp1p0"
	.file	"nettle-sha256.c"
	.text
	.globl	sha256_init                     # -- Begin function sha256_init
	.p2align	1
	.type	sha256_init,@function
sha256_init:                            # @sha256_init
# %bb.0:
	cm.push	{ra}, -32
	sw	a0, 12(sp)
	lui	a1, %hi(sha256_init.H0)
	addi	a1, a1, %lo(sha256_init.H0)
	li	a2, 32
	call	memcpy
	lw	a0, 12(sp)
	sw	zero, 32(a0)
	sw	zero, 36(a0)
	sw	zero, 104(a0)
	cm.popret	{ra}, 32
.Lfunc_end0:
	.size	sha256_init, .Lfunc_end0-sha256_init
                                        # -- End function
	.hidden	sha256_init.H0
	.ident	"clang version 22.1.8 (https://github.com/llvm/llvm-project.git ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)"
	.section	".note.GNU-stack","",@progbits
