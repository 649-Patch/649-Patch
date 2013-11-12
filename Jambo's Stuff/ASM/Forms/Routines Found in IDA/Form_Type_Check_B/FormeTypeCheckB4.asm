.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, wormadam
	cmp r0, r1
	beq next3
	mov r0, #0xF6
	lsl r0, r0, #0x1
	cmp r0, r1
	beq shaymincode
	ldr r0, meloetta
	cmp r0, r1
	bne exit
	b meloettacode
next3:	bl getaddress
	ldrb r0, [r0, #0x1B]
	mov r3, #0xF0
	and r0, r3
	cmp r0, #0x0
	beq exit
	cmp r0, #0x10
	bne next
	add r2, #0x21
	mov r0, #0x6
	strb r0, [r2, #0x0]
	mov r0, #0x4
	strb r0, [r2, #0x1]
	b there
next:	cmp r0, #0x20
	bne exit
	add r2, #0x21
	mov r0, #0x6
	strb r0, [r2, #0x0]
	mov r0, #0x8
	strb r0, [r2, #0x1]
there:	ldr r1, return
	bx r1
exit:	lsl r0, r1, #0x3
	sub r0, r0, r1
	lsl r0, r0, #0x2
	add r0, r0, r6
	ldrb r0, [r0, #0x6]
	add r2, #0x21
	strb r0, [r2, #0x0]
	ldr r2, return2
	bx r2
shaymincode:	ldr r0, statusbyte
	ldrb r0, [r0, #0x0]
	cmp r0, #0x4
	bge exit
	cmp r0, #0x1
	blt exit
	bl getaddress
	ldrb r0, [r0, #0x1B]
	mov r3, #0xF0
	and r0, r3
	cmp r0, #0x0
	beq exit
	cmp r0, #0x10
	bne exit
	add r2, #0x21
	mov r0, #0xC
	strb r0, [r2, #0x0]
	mov r0, #0x2
	strb r0, [r2, #0x1]
	b there
meloettacode:	bl getaddress
	ldrb r0, [r0, #0x1B]
	mov r3, #0xF0
	and r0, r3
	cmp r0, #0x0
	beq exit
	cmp r0, #0x10
	bne exit
	add r2, #0x21
	mov r0, #0x0
	strb r0, [r2, #0x0]
	mov r0, #0x1
	strb r0, [r2, #0x1]
	b there
getaddress:	ldr r0, getadd
	bx r0
.align
return:		.word 0x08013145
return2:	.word 0x0801312B
wormadam:	.word 0x0000019D
statusbyte:	.word 0x0203C000
meloetta:	.word 0x00000288
getadd:		.word 0x0874A459
