	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_d2p2_zicsr2p0_zifencei2p0"
	.file	"test.c"
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -1056
	sw	ra, 1052(sp)                    # 4-byte Folded Spill
	sw	s0, 1048(sp)                    # 4-byte Folded Spill
	addi	s0, sp, 1056
	li	a0, 0
	sw	a0, -1044(s0)                   # 4-byte Folded Spill
	sw	a0, -16(s0)
	lui	a0, 167
	addi	a0, a0, -1944
	sw	a0, -20(s0)
	lui	a0, 426499
	addi	a0, a0, 878
	sw	a0, -24(s0)
	lui	a0, 431639
	addi	a0, a0, -758
	sw	a0, -28(s0)
	lui	a0, 398935
	addi	a0, a0, -992
	sw	a0, -32(s0)
	lui	a0, 456343
	addi	a0, a0, -1941
	sw	a0, -36(s0)
	li	a0, 12
	sw	a0, -1040(s0)
	lw	a2, -1040(s0)
	addi	a0, s0, -36
	addi	a1, s0, -1036
	call	contour
                                        # kill: def $x11 killed $x10
	lw	a0, -1044(s0)                   # 4-byte Folded Reload
	lw	ra, 1052(sp)                    # 4-byte Folded Reload
	lw	s0, 1048(sp)                    # 4-byte Folded Reload
	addi	sp, sp, 1056
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.globl	contour                         # -- Begin function contour
	.p2align	2
	.type	contour,@function
contour:                                # @contour
# %bb.0:
	addi	sp, sp, -160
	sw	ra, 156(sp)                     # 4-byte Folded Spill
	sw	s0, 152(sp)                     # 4-byte Folded Spill
	addi	s0, sp, 160
	sw	a0, -16(s0)
	sw	a1, -20(s0)
	sw	a2, -24(s0)
	li	a0, 0
	sw	a0, -28(s0)
	j	.LBB1_1
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -28(s0)
	lw	a1, -24(s0)
	addi	a1, a1, 2
	bge	a0, a1, .LBB1_4
	j	.LBB1_2
.LBB1_2:                                #   in Loop: Header=BB1_1 Depth=1
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB1_3
.LBB1_3:                                #   in Loop: Header=BB1_1 Depth=1
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB1_1
.LBB1_4:
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	li	a0, 0
	sw	a0, -136(s0)
	j	.LBB1_5
.LBB1_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_25 Depth 2
                                        #     Child Loop BB1_16 Depth 2
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	beqz	a0, .LBB1_34
	j	.LBB1_6
.LBB1_6:                                #   in Loop: Header=BB1_5 Depth=1
	lw	a0, -136(s0)
	lw	a1, -24(s0)
	bne	a0, a1, .LBB1_10
	j	.LBB1_7
.LBB1_7:                                #   in Loop: Header=BB1_5 Depth=1
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	li	a1, 10
	bne	a0, a1, .LBB1_9
	j	.LBB1_8
.LBB1_8:                                #   in Loop: Header=BB1_5 Depth=1
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB1_9
.LBB1_9:                                #   in Loop: Header=BB1_5 Depth=1
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	li	a0, 0
	sw	a0, -136(s0)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	j	.LBB1_33
.LBB1_10:                               #   in Loop: Header=BB1_5 Depth=1
	lw	a0, -20(s0)
	lbu	a0, -1(a0)
	li	a1, 10
	bne	a0, a1, .LBB1_12
	j	.LBB1_11
.LBB1_11:                               #   in Loop: Header=BB1_5 Depth=1
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	li	a0, 0
	sw	a0, -136(s0)
	j	.LBB1_32
.LBB1_12:                               #   in Loop: Header=BB1_5 Depth=1
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	li	a1, 32
	bne	a0, a1, .LBB1_14
	j	.LBB1_13
.LBB1_13:                               #   in Loop: Header=BB1_5 Depth=1
	lw	a1, -20(s0)
	li	a0, 32
	sb	a0, 0(a1)
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	lw	a0, -136(s0)
	addi	a0, a0, 1
	sw	a0, -136(s0)
	j	.LBB1_31
.LBB1_14:                               #   in Loop: Header=BB1_5 Depth=1
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	li	a1, 10
	bne	a0, a1, .LBB1_20
	j	.LBB1_15
.LBB1_15:                               #   in Loop: Header=BB1_5 Depth=1
	li	a0, 0
	sw	a0, -140(s0)
	j	.LBB1_16
.LBB1_16:                               #   Parent Loop BB1_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -140(s0)
	lw	a1, -24(s0)
	lw	a2, -136(s0)
	sub	a1, a1, a2
	bge	a0, a1, .LBB1_19
	j	.LBB1_17
.LBB1_17:                               #   in Loop: Header=BB1_16 Depth=2
	lw	a1, -20(s0)
	li	a0, 32
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB1_18
.LBB1_18:                               #   in Loop: Header=BB1_16 Depth=2
	lw	a0, -140(s0)
	addi	a0, a0, 1
	sw	a0, -140(s0)
	j	.LBB1_16
.LBB1_19:                               #   in Loop: Header=BB1_5 Depth=1
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	li	a0, 0
	sw	a0, -136(s0)
	j	.LBB1_30
.LBB1_20:                               #   in Loop: Header=BB1_5 Depth=1
	lw	a0, -16(s0)
	addi	a1, s0, -128
	addi	a2, s0, -132
	call	lire_mot
	lw	a1, -132(s0)
	lw	a0, -24(s0)
	lw	a2, -136(s0)
	sub	a0, a0, a2
	blt	a0, a1, .LBB1_22
	j	.LBB1_21
.LBB1_21:                               #   in Loop: Header=BB1_5 Depth=1
	lw	a0, -20(s0)
	lw	a2, -132(s0)
	addi	a1, s0, -128
	call	ecrire_mot
	lw	a0, -132(s0)
	lw	a1, -20(s0)
	add	a0, a0, a1
	addi	a0, a0, -1
	sw	a0, -20(s0)
	lw	a1, -132(s0)
	lw	a0, -16(s0)
	add	a0, a0, a1
	sw	a0, -16(s0)
	lw	a1, -132(s0)
	lw	a0, -136(s0)
	add	a0, a0, a1
	sw	a0, -136(s0)
	j	.LBB1_29
.LBB1_22:                               #   in Loop: Header=BB1_5 Depth=1
	lw	a0, -136(s0)
	bnez	a0, .LBB1_24
	j	.LBB1_23
.LBB1_23:
	li	a0, 0
	sw	a0, -12(s0)
	j	.LBB1_39
.LBB1_24:                               #   in Loop: Header=BB1_5 Depth=1
	li	a0, 0
	sw	a0, -144(s0)
	j	.LBB1_25
.LBB1_25:                               #   Parent Loop BB1_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -144(s0)
	lw	a1, -24(s0)
	lw	a2, -136(s0)
	sub	a1, a1, a2
	bge	a0, a1, .LBB1_28
	j	.LBB1_26
.LBB1_26:                               #   in Loop: Header=BB1_25 Depth=2
	lw	a1, -20(s0)
	li	a0, 32
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB1_27
.LBB1_27:                               #   in Loop: Header=BB1_25 Depth=2
	lw	a0, -144(s0)
	addi	a0, a0, 1
	sw	a0, -144(s0)
	j	.LBB1_25
.LBB1_28:                               #   in Loop: Header=BB1_5 Depth=1
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	j	.LBB1_29
.LBB1_29:                               #   in Loop: Header=BB1_5 Depth=1
	j	.LBB1_30
.LBB1_30:                               #   in Loop: Header=BB1_5 Depth=1
	j	.LBB1_31
.LBB1_31:                               #   in Loop: Header=BB1_5 Depth=1
	j	.LBB1_32
.LBB1_32:                               #   in Loop: Header=BB1_5 Depth=1
	j	.LBB1_33
.LBB1_33:                               #   in Loop: Header=BB1_5 Depth=1
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB1_5
.LBB1_34:
	li	a0, 0
	sw	a0, -148(s0)
	j	.LBB1_35
.LBB1_35:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -148(s0)
	lw	a1, -24(s0)
	addi	a1, a1, 2
	bge	a0, a1, .LBB1_38
	j	.LBB1_36
.LBB1_36:                               #   in Loop: Header=BB1_35 Depth=1
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB1_37
.LBB1_37:                               #   in Loop: Header=BB1_35 Depth=1
	lw	a0, -148(s0)
	addi	a0, a0, 1
	sw	a0, -148(s0)
	j	.LBB1_35
.LBB1_38:
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 0
	sb	a0, 0(a1)
	li	a0, 1
	sw	a0, -12(s0)
	j	.LBB1_39
.LBB1_39:
	lw	a0, -12(s0)
	lw	ra, 156(sp)                     # 4-byte Folded Reload
	lw	s0, 152(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 160
	ret
.Lfunc_end1:
	.size	contour, .Lfunc_end1-contour
                                        # -- End function
	.globl	lire_mot                        # -- Begin function lire_mot
	.p2align	2
	.type	lire_mot,@function
lire_mot:                               # @lire_mot
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a1, -20(s0)
	li	a0, 0
	sw	a0, 0(a1)
	j	.LBB2_1
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -12(s0)
	li	a1, 0
	sw	a1, -24(s0)                     # 4-byte Folded Spill
	beqz	a0, .LBB2_5
	j	.LBB2_2
.LBB2_2:                                #   in Loop: Header=BB2_1 Depth=1
	lw	a0, -12(s0)
	lbu	a0, 0(a0)
	li	a2, 0
	li	a1, 32
	sw	a2, -24(s0)                     # 4-byte Folded Spill
	beq	a0, a1, .LBB2_5
	j	.LBB2_3
.LBB2_3:                                #   in Loop: Header=BB2_1 Depth=1
	lw	a0, -12(s0)
	lbu	a0, 0(a0)
	li	a2, 0
	li	a1, 10
	sw	a2, -24(s0)                     # 4-byte Folded Spill
	beq	a0, a1, .LBB2_5
	j	.LBB2_4
.LBB2_4:                                #   in Loop: Header=BB2_1 Depth=1
	lw	a0, -12(s0)
	lbu	a0, 0(a0)
	snez	a0, a0
	sw	a0, -24(s0)                     # 4-byte Folded Spill
	j	.LBB2_5
.LBB2_5:                                #   in Loop: Header=BB2_1 Depth=1
	lw	a0, -24(s0)                     # 4-byte Folded Reload
	andi	a0, a0, 1
	beqz	a0, .LBB2_7
	j	.LBB2_6
.LBB2_6:                                #   in Loop: Header=BB2_1 Depth=1
	lw	a0, -12(s0)
	lbu	a0, 0(a0)
	lw	a1, -16(s0)
	lw	a4, -20(s0)
	lw	a2, 0(a4)
	addi	a3, a2, 1
	sw	a3, 0(a4)
	add	a1, a1, a2
	sb	a0, 0(a1)
	lw	a0, -12(s0)
	addi	a0, a0, 1
	sw	a0, -12(s0)
	j	.LBB2_1
.LBB2_7:
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end2:
	.size	lire_mot, .Lfunc_end2-lire_mot
                                        # -- End function
	.globl	ecrire_mot                      # -- Begin function ecrire_mot
	.p2align	2
	.type	ecrire_mot,@function
ecrire_mot:                             # @ecrire_mot
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	li	a0, 0
	sw	a0, -24(s0)
	j	.LBB3_1
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -24(s0)
	lw	a1, -20(s0)
	bge	a0, a1, .LBB3_4
	j	.LBB3_2
.LBB3_2:                                #   in Loop: Header=BB3_1 Depth=1
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	add	a0, a0, a1
	lbu	a0, 0(a0)
	lw	a1, -12(s0)
	sb	a0, 0(a1)
	lw	a0, -12(s0)
	addi	a0, a0, 1
	sw	a0, -12(s0)
	j	.LBB3_3
.LBB3_3:                                #   in Loop: Header=BB3_1 Depth=1
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	j	.LBB3_1
.LBB3_4:
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end3:
	.size	ecrire_mot, .Lfunc_end3-ecrire_mot
                                        # -- End function
	.globl	contour_milieu                  # -- Begin function contour_milieu
	.p2align	2
	.type	contour_milieu,@function
contour_milieu:                         # @contour_milieu
# %bb.0:
	addi	sp, sp, -272
	sw	ra, 268(sp)                     # 4-byte Folded Spill
	sw	s0, 264(sp)                     # 4-byte Folded Spill
	addi	s0, sp, 272
	sw	a0, -16(s0)
	sw	a1, -20(s0)
	sw	a2, -24(s0)
	li	a0, 0
	sw	a0, -28(s0)
	j	.LBB4_1
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -28(s0)
	lw	a1, -24(s0)
	addi	a1, a1, 2
	bge	a0, a1, .LBB4_4
	j	.LBB4_2
.LBB4_2:                                #   in Loop: Header=BB4_1 Depth=1
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB4_3
.LBB4_3:                                #   in Loop: Header=BB4_1 Depth=1
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB4_1
.LBB4_4:
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	li	a0, 0
	sw	a0, -232(s0)
	sw	a0, -240(s0)
	j	.LBB4_5
.LBB4_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_33 Depth 2
                                        #     Child Loop BB4_37 Depth 2
                                        #     Child Loop BB4_18 Depth 2
                                        #     Child Loop BB4_22 Depth 2
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	beqz	a0, .LBB4_46
	j	.LBB4_6
.LBB4_6:                                #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -240(s0)
	lw	a1, -24(s0)
	bne	a0, a1, .LBB4_10
	j	.LBB4_7
.LBB4_7:                                #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	li	a1, 10
	bne	a0, a1, .LBB4_9
	j	.LBB4_8
.LBB4_8:                                #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB4_9
.LBB4_9:                                #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -20(s0)
	lw	a2, -232(s0)
	addi	a1, s0, -228
	call	ecrire_mot
	lw	a1, -232(s0)
	lw	a0, -20(s0)
	add	a0, a0, a1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	li	a0, 0
	sw	a0, -232(s0)
	sw	a0, -240(s0)
	j	.LBB4_45
.LBB4_10:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -20(s0)
	lbu	a0, -1(a0)
	li	a1, 10
	bne	a0, a1, .LBB4_12
	j	.LBB4_11
.LBB4_11:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	li	a0, 0
	sw	a0, -240(s0)
	sw	a0, -232(s0)
	j	.LBB4_44
.LBB4_12:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	li	a1, 32
	bne	a0, a1, .LBB4_14
	j	.LBB4_13
.LBB4_13:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a1, -232(s0)
	addi	a0, s0, -228
	add	a1, a0, a1
	li	a0, 32
	sb	a0, 0(a1)
	lw	a0, -232(s0)
	addi	a0, a0, 1
	sw	a0, -232(s0)
	lw	a0, -240(s0)
	addi	a0, a0, 1
	sw	a0, -240(s0)
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB4_43
.LBB4_14:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	li	a1, 10
	bne	a0, a1, .LBB4_26
	j	.LBB4_15
.LBB4_15:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -232(s0)
	addi	a1, s0, -228
	add	a0, a0, a1
	lbu	a0, -1(a0)
	li	a1, 32
	bne	a0, a1, .LBB4_17
	j	.LBB4_16
.LBB4_16:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -232(s0)
	addi	a0, a0, -1
	sw	a0, -232(s0)
	lw	a0, -240(s0)
	addi	a0, a0, -1
	sw	a0, -240(s0)
	j	.LBB4_17
.LBB4_17:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -24(s0)
	lw	a1, -240(s0)
	sub	a0, a0, a1
	srli	a1, a0, 31
	add	a1, a0, a1
	andi	a1, a1, -2
	sub	a0, a0, a1
	sw	a0, -244(s0)
	li	a0, 0
	sw	a0, -248(s0)
	j	.LBB4_18
.LBB4_18:                               #   Parent Loop BB4_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -248(s0)
	lw	a1, -24(s0)
	lw	a2, -240(s0)
	sub	a1, a1, a2
	srli	a2, a1, 31
	add	a1, a1, a2
	srai	a1, a1, 1
	bge	a0, a1, .LBB4_21
	j	.LBB4_19
.LBB4_19:                               #   in Loop: Header=BB4_18 Depth=2
	lw	a1, -20(s0)
	li	a0, 32
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB4_20
.LBB4_20:                               #   in Loop: Header=BB4_18 Depth=2
	lw	a0, -248(s0)
	addi	a0, a0, 1
	sw	a0, -248(s0)
	j	.LBB4_18
.LBB4_21:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -20(s0)
	lw	a2, -232(s0)
	addi	a1, s0, -228
	call	ecrire_mot
	lw	a1, -232(s0)
	lw	a0, -20(s0)
	add	a0, a0, a1
	sw	a0, -20(s0)
	li	a0, 0
	sw	a0, -252(s0)
	j	.LBB4_22
.LBB4_22:                               #   Parent Loop BB4_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -252(s0)
	lw	a1, -24(s0)
	lw	a2, -240(s0)
	sub	a1, a1, a2
	srli	a2, a1, 31
	add	a1, a1, a2
	srai	a1, a1, 1
	lw	a2, -244(s0)
	add	a1, a1, a2
	bge	a0, a1, .LBB4_25
	j	.LBB4_23
.LBB4_23:                               #   in Loop: Header=BB4_22 Depth=2
	lw	a1, -20(s0)
	li	a0, 32
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB4_24
.LBB4_24:                               #   in Loop: Header=BB4_22 Depth=2
	lw	a0, -252(s0)
	addi	a0, a0, 1
	sw	a0, -252(s0)
	j	.LBB4_22
.LBB4_25:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB4_42
.LBB4_26:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -16(s0)
	addi	a1, s0, -128
	addi	a2, s0, -236
	call	lire_mot
	lw	a1, -236(s0)
	lw	a0, -24(s0)
	lw	a2, -240(s0)
	sub	a0, a0, a2
	blt	a0, a1, .LBB4_28
	j	.LBB4_27
.LBB4_27:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a1, -232(s0)
	addi	a0, s0, -228
	add	a0, a0, a1
	lw	a2, -236(s0)
	addi	a1, s0, -128
	call	ecrire_mot
	lw	a1, -236(s0)
	lw	a0, -232(s0)
	add	a0, a0, a1
	sw	a0, -232(s0)
	lw	a1, -236(s0)
	lw	a0, -240(s0)
	add	a0, a0, a1
	sw	a0, -240(s0)
	lw	a1, -236(s0)
	lw	a0, -16(s0)
	add	a0, a0, a1
	sw	a0, -16(s0)
	j	.LBB4_41
.LBB4_28:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -240(s0)
	bnez	a0, .LBB4_30
	j	.LBB4_29
.LBB4_29:
	li	a0, 0
	sw	a0, -12(s0)
	j	.LBB4_51
.LBB4_30:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -232(s0)
	addi	a1, s0, -228
	add	a0, a0, a1
	lbu	a0, -1(a0)
	li	a1, 32
	bne	a0, a1, .LBB4_32
	j	.LBB4_31
.LBB4_31:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -232(s0)
	addi	a0, a0, -1
	sw	a0, -232(s0)
	lw	a0, -240(s0)
	addi	a0, a0, -1
	sw	a0, -240(s0)
	j	.LBB4_32
.LBB4_32:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -24(s0)
	lw	a1, -240(s0)
	sub	a0, a0, a1
	srli	a1, a0, 31
	add	a1, a0, a1
	andi	a1, a1, -2
	sub	a0, a0, a1
	sw	a0, -256(s0)
	li	a0, 0
	sw	a0, -260(s0)
	j	.LBB4_33
.LBB4_33:                               #   Parent Loop BB4_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -260(s0)
	lw	a1, -24(s0)
	lw	a2, -240(s0)
	sub	a1, a1, a2
	srli	a2, a1, 31
	add	a1, a1, a2
	srai	a1, a1, 1
	bge	a0, a1, .LBB4_36
	j	.LBB4_34
.LBB4_34:                               #   in Loop: Header=BB4_33 Depth=2
	lw	a1, -20(s0)
	li	a0, 32
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB4_35
.LBB4_35:                               #   in Loop: Header=BB4_33 Depth=2
	lw	a0, -260(s0)
	addi	a0, a0, 1
	sw	a0, -260(s0)
	j	.LBB4_33
.LBB4_36:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a0, -20(s0)
	lw	a2, -232(s0)
	addi	a1, s0, -228
	call	ecrire_mot
	lw	a1, -232(s0)
	lw	a0, -20(s0)
	add	a0, a0, a1
	sw	a0, -20(s0)
	li	a0, 0
	sw	a0, -264(s0)
	j	.LBB4_37
.LBB4_37:                               #   Parent Loop BB4_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -264(s0)
	lw	a1, -24(s0)
	lw	a2, -240(s0)
	sub	a1, a1, a2
	srli	a2, a1, 31
	add	a1, a1, a2
	srai	a1, a1, 1
	lw	a2, -256(s0)
	add	a1, a1, a2
	bge	a0, a1, .LBB4_40
	j	.LBB4_38
.LBB4_38:                               #   in Loop: Header=BB4_37 Depth=2
	lw	a1, -20(s0)
	li	a0, 32
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB4_39
.LBB4_39:                               #   in Loop: Header=BB4_37 Depth=2
	lw	a0, -264(s0)
	addi	a0, a0, 1
	sw	a0, -264(s0)
	j	.LBB4_37
.LBB4_40:                               #   in Loop: Header=BB4_5 Depth=1
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB4_41
.LBB4_41:                               #   in Loop: Header=BB4_5 Depth=1
	j	.LBB4_42
.LBB4_42:                               #   in Loop: Header=BB4_5 Depth=1
	j	.LBB4_43
.LBB4_43:                               #   in Loop: Header=BB4_5 Depth=1
	j	.LBB4_44
.LBB4_44:                               #   in Loop: Header=BB4_5 Depth=1
	j	.LBB4_45
.LBB4_45:                               #   in Loop: Header=BB4_5 Depth=1
	j	.LBB4_5
.LBB4_46:
	li	a0, 0
	sw	a0, -268(s0)
	j	.LBB4_47
.LBB4_47:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -268(s0)
	lw	a1, -24(s0)
	addi	a1, a1, 2
	bge	a0, a1, .LBB4_50
	j	.LBB4_48
.LBB4_48:                               #   in Loop: Header=BB4_47 Depth=1
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB4_49
.LBB4_49:                               #   in Loop: Header=BB4_47 Depth=1
	lw	a0, -268(s0)
	addi	a0, a0, 1
	sw	a0, -268(s0)
	j	.LBB4_47
.LBB4_50:
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 0
	sb	a0, 0(a1)
	li	a0, 1
	sw	a0, -12(s0)
	j	.LBB4_51
.LBB4_51:
	lw	a0, -12(s0)
	lw	ra, 268(sp)                     # 4-byte Folded Reload
	lw	s0, 264(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 272
	ret
.Lfunc_end4:
	.size	contour_milieu, .Lfunc_end4-contour_milieu
                                        # -- End function
	.globl	contour_droite                  # -- Begin function contour_droite
	.p2align	2
	.type	contour_droite,@function
contour_droite:                         # @contour_droite
# %bb.0:
	addi	sp, sp, -256
	sw	ra, 252(sp)                     # 4-byte Folded Spill
	sw	s0, 248(sp)                     # 4-byte Folded Spill
	addi	s0, sp, 256
	sw	a0, -16(s0)
	sw	a1, -20(s0)
	sw	a2, -24(s0)
	li	a0, 0
	sw	a0, -28(s0)
	j	.LBB5_1
.LBB5_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -28(s0)
	lw	a1, -24(s0)
	addi	a1, a1, 2
	bge	a0, a1, .LBB5_4
	j	.LBB5_2
.LBB5_2:                                #   in Loop: Header=BB5_1 Depth=1
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB5_3
.LBB5_3:                                #   in Loop: Header=BB5_1 Depth=1
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB5_1
.LBB5_4:
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	li	a0, 0
	sw	a0, -232(s0)
	sw	a0, -240(s0)
	j	.LBB5_5
.LBB5_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_31 Depth 2
                                        #     Child Loop BB5_20 Depth 2
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	beqz	a0, .LBB5_40
	j	.LBB5_6
.LBB5_6:                                #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -240(s0)
	lw	a1, -24(s0)
	bne	a0, a1, .LBB5_12
	j	.LBB5_7
.LBB5_7:                                #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	li	a1, 10
	bne	a0, a1, .LBB5_9
	j	.LBB5_8
.LBB5_8:                                #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB5_9
.LBB5_9:                                #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -232(s0)
	addi	a1, s0, -228
	add	a0, a0, a1
	lbu	a0, -1(a0)
	li	a1, 32
	bne	a0, a1, .LBB5_11
	j	.LBB5_10
.LBB5_10:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -232(s0)
	addi	a0, a0, -1
	sw	a0, -232(s0)
	lw	a0, -240(s0)
	addi	a0, a0, -1
	sw	a0, -240(s0)
	lw	a1, -20(s0)
	li	a0, 32
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB5_11
.LBB5_11:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -20(s0)
	lw	a2, -232(s0)
	addi	a1, s0, -228
	call	ecrire_mot
	lw	a1, -232(s0)
	lw	a0, -20(s0)
	add	a0, a0, a1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	li	a0, 0
	sw	a0, -232(s0)
	sw	a0, -240(s0)
	j	.LBB5_39
.LBB5_12:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -20(s0)
	lbu	a0, -1(a0)
	li	a1, 10
	bne	a0, a1, .LBB5_14
	j	.LBB5_13
.LBB5_13:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	li	a0, 0
	sw	a0, -240(s0)
	sw	a0, -232(s0)
	j	.LBB5_38
.LBB5_14:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	li	a1, 32
	bne	a0, a1, .LBB5_16
	j	.LBB5_15
.LBB5_15:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a1, -232(s0)
	addi	a0, s0, -228
	add	a1, a0, a1
	li	a0, 32
	sb	a0, 0(a1)
	lw	a0, -232(s0)
	addi	a0, a0, 1
	sw	a0, -232(s0)
	lw	a0, -240(s0)
	addi	a0, a0, 1
	sw	a0, -240(s0)
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB5_37
.LBB5_16:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	li	a1, 10
	bne	a0, a1, .LBB5_24
	j	.LBB5_17
.LBB5_17:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -232(s0)
	addi	a1, s0, -228
	add	a0, a0, a1
	lbu	a0, -1(a0)
	li	a1, 32
	bne	a0, a1, .LBB5_19
	j	.LBB5_18
.LBB5_18:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -232(s0)
	addi	a0, a0, -1
	sw	a0, -232(s0)
	lw	a0, -240(s0)
	addi	a0, a0, -1
	sw	a0, -240(s0)
	j	.LBB5_19
.LBB5_19:                               #   in Loop: Header=BB5_5 Depth=1
	li	a0, 0
	sw	a0, -244(s0)
	j	.LBB5_20
.LBB5_20:                               #   Parent Loop BB5_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -244(s0)
	lw	a1, -24(s0)
	lw	a2, -240(s0)
	sub	a1, a1, a2
	bge	a0, a1, .LBB5_23
	j	.LBB5_21
.LBB5_21:                               #   in Loop: Header=BB5_20 Depth=2
	lw	a1, -20(s0)
	li	a0, 32
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB5_22
.LBB5_22:                               #   in Loop: Header=BB5_20 Depth=2
	lw	a0, -244(s0)
	addi	a0, a0, 1
	sw	a0, -244(s0)
	j	.LBB5_20
.LBB5_23:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -20(s0)
	lw	a2, -232(s0)
	addi	a1, s0, -228
	call	ecrire_mot
	lw	a1, -232(s0)
	lw	a0, -20(s0)
	add	a0, a0, a1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB5_36
.LBB5_24:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -16(s0)
	addi	a1, s0, -128
	addi	a2, s0, -236
	call	lire_mot
	lw	a1, -236(s0)
	lw	a0, -24(s0)
	lw	a2, -240(s0)
	sub	a0, a0, a2
	blt	a0, a1, .LBB5_26
	j	.LBB5_25
.LBB5_25:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a1, -232(s0)
	addi	a0, s0, -228
	add	a0, a0, a1
	lw	a2, -236(s0)
	addi	a1, s0, -128
	call	ecrire_mot
	lw	a1, -236(s0)
	lw	a0, -232(s0)
	add	a0, a0, a1
	sw	a0, -232(s0)
	lw	a1, -236(s0)
	lw	a0, -240(s0)
	add	a0, a0, a1
	sw	a0, -240(s0)
	lw	a1, -236(s0)
	lw	a0, -16(s0)
	add	a0, a0, a1
	sw	a0, -16(s0)
	j	.LBB5_35
.LBB5_26:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -240(s0)
	bnez	a0, .LBB5_28
	j	.LBB5_27
.LBB5_27:
	li	a0, 0
	sw	a0, -12(s0)
	j	.LBB5_45
.LBB5_28:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -232(s0)
	addi	a1, s0, -228
	add	a0, a0, a1
	lbu	a0, -1(a0)
	li	a1, 32
	bne	a0, a1, .LBB5_30
	j	.LBB5_29
.LBB5_29:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -232(s0)
	addi	a0, a0, -1
	sw	a0, -232(s0)
	lw	a0, -240(s0)
	addi	a0, a0, -1
	sw	a0, -240(s0)
	j	.LBB5_30
.LBB5_30:                               #   in Loop: Header=BB5_5 Depth=1
	li	a0, 0
	sw	a0, -248(s0)
	j	.LBB5_31
.LBB5_31:                               #   Parent Loop BB5_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -248(s0)
	lw	a1, -24(s0)
	lw	a2, -240(s0)
	sub	a1, a1, a2
	bge	a0, a1, .LBB5_34
	j	.LBB5_32
.LBB5_32:                               #   in Loop: Header=BB5_31 Depth=2
	lw	a1, -20(s0)
	li	a0, 32
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB5_33
.LBB5_33:                               #   in Loop: Header=BB5_31 Depth=2
	lw	a0, -248(s0)
	addi	a0, a0, 1
	sw	a0, -248(s0)
	j	.LBB5_31
.LBB5_34:                               #   in Loop: Header=BB5_5 Depth=1
	lw	a0, -20(s0)
	lw	a2, -232(s0)
	addi	a1, s0, -228
	call	ecrire_mot
	lw	a1, -232(s0)
	lw	a0, -20(s0)
	add	a0, a0, a1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB5_35
.LBB5_35:                               #   in Loop: Header=BB5_5 Depth=1
	j	.LBB5_36
.LBB5_36:                               #   in Loop: Header=BB5_5 Depth=1
	j	.LBB5_37
.LBB5_37:                               #   in Loop: Header=BB5_5 Depth=1
	j	.LBB5_38
.LBB5_38:                               #   in Loop: Header=BB5_5 Depth=1
	j	.LBB5_39
.LBB5_39:                               #   in Loop: Header=BB5_5 Depth=1
	j	.LBB5_5
.LBB5_40:
	li	a0, 0
	sw	a0, -252(s0)
	j	.LBB5_41
.LBB5_41:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -252(s0)
	lw	a1, -24(s0)
	addi	a1, a1, 2
	bge	a0, a1, .LBB5_44
	j	.LBB5_42
.LBB5_42:                               #   in Loop: Header=BB5_41 Depth=1
	lw	a1, -20(s0)
	li	a0, 42
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB5_43
.LBB5_43:                               #   in Loop: Header=BB5_41 Depth=1
	lw	a0, -252(s0)
	addi	a0, a0, 1
	sw	a0, -252(s0)
	j	.LBB5_41
.LBB5_44:
	lw	a1, -20(s0)
	li	a0, 10
	sb	a0, 0(a1)
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	li	a0, 0
	sb	a0, 0(a1)
	li	a0, 1
	sw	a0, -12(s0)
	j	.LBB5_45
.LBB5_45:
	lw	a0, -12(s0)
	lw	ra, 252(sp)                     # 4-byte Folded Reload
	lw	s0, 248(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 256
	ret
.Lfunc_end5:
	.size	contour_droite, .Lfunc_end5-contour_droite
                                        # -- End function
	.type	.L__const.main.file,@object     # @__const.main.file
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__const.main.file:
	.asciz	"khio lea\nmain3 hhh\n"
	.size	.L__const.main.file, 20

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym contour
	.addrsig_sym lire_mot
	.addrsig_sym ecrire_mot
