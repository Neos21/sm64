# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "macros.inc"


.section .text, "ax"

# TODO: replace 2CEE0 with __bss1size

glabel EntryPoint
    lui   $t0, %hi(_mainSegmentNoloadStart) # $t0, 0x8034
    lui   $t1, (0x0002CEE0 >> 16) # lui $t1, 2
    addiu $t0, %lo(_mainSegmentNoloadStart) # addiu $t0, $t0, -0x6df0
    ori   $t1, (0x0002CEE0 & 0xFFFF) # ori $t1, $t1, 0xcee0
.L80246010:
    addi  $t1, $t1, -8
    sw    $zero, ($t0)
    sw    $zero, 4($t0)
    bnez  $t1, .L80246010
     addi  $t0, $t0, 8
    lui   $t2, %hi(Main) # $t2, 0x8024
    lui   $sp, %hi(gIdleThreadStack) # $sp, 0x8020
    addiu $t2, %lo(Main) # addiu $t2, $t2, 0x6dc4
    jr    $t2
     addiu $sp, %lo(gIdleThreadStack) # addiu $sp, $sp, 0xa00
    nop
    nop
    nop
    nop
    nop
    nop
