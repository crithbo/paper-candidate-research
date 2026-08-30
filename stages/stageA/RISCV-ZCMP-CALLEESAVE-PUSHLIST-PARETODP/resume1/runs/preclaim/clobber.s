	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcmp1p0"
	.text
	.globl	clobber
	.p2align	1
	.type	clobber,@function
clobber:
	li	t0, 1
	li	t1, 2
	li	t2, 3
	li	a0, 4
	li	a1, 5
	ret
	.size	clobber, .-clobber
