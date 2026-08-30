	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcmp1p0"
	.file	"witness.ll"
	.text
	.globl	witness                         # -- Begin function witness
	.p2align	1
	.type	witness,@function
witness:                                # @witness
	.cfi_startproc
# %bb.0:                                # %entry
	cm.push	{ra, s0-s1}, -16
	.cfi_def_cfa_offset 16
	.cfi_offset ra, -12
	.cfi_offset s0, -8
	.cfi_offset s1, -4
	cm.mvsa01	s1, s0
	call	clobber
	add	a0, s1, s0
	cm.popret	{ra, s0-s1}, 16
.Lfunc_end0:
	.size	witness, .Lfunc_end0-witness
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
