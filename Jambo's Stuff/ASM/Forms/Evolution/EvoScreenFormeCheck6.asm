.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, deerling
	cmp r0, r2
	beq jump
	add r0, #0x1
	cmp r0, r2
	bne exit
jump:	ldr r0, statusbyte
	ldrb r0, [r0, #0x1]
	lsl r1, r0, #0x2
	ldr r0, [r3, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	b exit2
exit:	ldr r0, [r3, #0x0]
exit2:	add r1, r4, #0x0
	bl place
	ldr r0, return
	bx r0
place:	ldr r3, place2
	bx r3
.align
return:		.word 0x0800ECB5
place2:		.word 0x081E3B71
deerling:	.word 0x00000249
statusbyte:	.word 0x0203C000
