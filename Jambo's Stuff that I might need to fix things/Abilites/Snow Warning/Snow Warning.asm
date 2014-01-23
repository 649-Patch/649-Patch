.text
.align 2
.thumb
.thumb_func
.global snowwarning

main:
        ldrb r4, [r3, #0x0]
        cmp r1, r4
        bcc check
        strb r0, [r2, #0x0]
check:
	mov r1, r8
        ldrb r0, [r1, #0x0]
        cmp r0, #0x75
        bne skip2
setbank:
	ldr r0, .userbank
	ldr r0, [r0, #0x0]
	lsl r0, #0x18
	lsr r0, #0x18
	cmp r0, #0x75
	beq snow
	ldr r0, .bank
	mov r2, #0x1
	strb r2, [r0]
snow:
        ldr r2, .place
        ldrh r1, [r2, #0x0]
        mov r0, #0x7F
        and r0, r1
        cmp r0, #0x0
        beq yes
        bl one
yes:
	ldr r0, .secondroutine
	bx r0
	ldr r2, [sp, #0x284]
	lsr r0, r2, #0x2
skip2:
	ldr r1, .return
	bx r1
one:        ldr r4, .twoloc
        bx r4
.align
.bank:         .word 0x2023D6B
.userbank:         .word 0x02023C04
.secondroutine:         .word 0x08765FA9
.return:        .word 0x0801A13F
.place:        .word 0x02023F1C
.twoloc:        .word 0x0801BBAB