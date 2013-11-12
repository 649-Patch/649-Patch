.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, arceus
	cmp r0, r1
	beq multiitemcode
	ldr r0, giratina
	cmp r0, r1
	bne exit
	b exit
multiitemcode:	add r0, r2, #0x0
	add r0, #0x2E
	ldrh r0, [r0, #0x0]
	sub r0, #0xE1
	cmp r0, #0x1
	blt exit
	cmp r0, #0x9
	beq exit
	cmp r0, #0x11
	bgt exit
	add r2, #0x21
	strb r0, [r2, #0x0]
	strb r0, [r2, #0x1]
	ldr r0, return
	bx r0
exit:	lsl r0, r1, #0x3
	sub r0, r0, r1
	lsl r0, r0, #0x2
	add r0, r0, r3
	ldrb r0, [r0, #0x6]
	add r2, #0x21
	strb r0, [r2, #0x0]
	ldr r0, return2
	bx r0
.align
arceus:	.word 0x000001ED
giratina:	.word 0x000001E7
return:		.word 0x08023FD1
return2:	.word 0x08023FB9
