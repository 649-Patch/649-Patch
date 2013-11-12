.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, one
	cmp r0, lr
	bne battlecode
	ldr r0, deerling
	cmp r0, r4
	beq jump
	add r0, #0x1
	cmp r0, r4
	bne exit
jump:	ldr r0, statusbyte
	ldrb r0, [r0, #0x1]
	lsl r1, r0, #0x2
	ldr r0, [r6, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	b exit2
exit:	ldr r0, [r6, #0x0]
	ldr r0, [r0, #0x0]
exit2:	add r1, r4, #0x0
	bl place
	ldr r0, return
	bx r0
place:	ldr r3, place2
	bx r3
battlecode:	ldr r0, deerling
	cmp r0, r2
	beq jump
	add r0, #0x1
	cmp r0, r2
	bne exit
	b jump
.align
return:		.word 0x0800ED8D
place2:		.word 0x081E3B71
partystart:	.word 0x0203B140
deerling:	.word 0x00000249
statusbyte:	.word 0x0203C000
one:		.word 0x0810BC0B
