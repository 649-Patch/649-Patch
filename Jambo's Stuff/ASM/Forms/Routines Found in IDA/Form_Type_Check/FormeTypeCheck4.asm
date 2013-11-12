.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r2, wormadam
	cmp r2, r4
	beq next3
	mov r2, #0xF6
	lsl r2, r2, #0x1
	cmp r2, r4
	beq shaymincode
	ldr r2, meloetta
	cmp r2, r4
	bne exit
	b meloettacode
next3:	ldr r2, partystart
	ldr r2, [r2, #0x0]
	ldr r1, number
	add r2, r1, r2
	ldrb r1, [r2, #0x1B]
	mov r2, #0xF0
	and r1, r2
	cmp r1, #0x0
	beq exit
	cmp r1, #0x10
	bne next
	push {r0}
	ldr r1, [r6, #0x0]
	ldr r3, number1
	add r1, r1, r3
	mov r0, #0x6
	strb r0, [r1, #0x0]
	mov r0, #0x4
	strb r0, [r1, #0x1]
	b there
next:	cmp r1, #0x20
	bne exit
	push {r0}
	ldr r1, [r6, #0x0]
	ldr r3, number1
	add r1, r1, r3
	mov r0, #0x6
	strb r0, [r1, #0x0]
	mov r0, #0x8
	strb r0, [r1, #0x1]
there:	pop {r0}
there2:	ldr r0, return
	bx r0
exit:	ldrb r2, [r0, #0x6]
	ldr r1, [r6, #0x0]
	ldr r3, number1
	add r1, r1, r3
	strb r2, [r1, #0x0]
	ldrb r0, [r0, #0x7]
	strb r0, [r1, #0x1]
	b there2
shaymincode:	ldr r2, statusbyteloc
	ldrb r2, [r2, #0x0]
	cmp r2, #0x4
	bge exit
	cmp r2, #0x1
	blt exit
	ldr r2, partystart
	ldr r2, [r2, #0x0]
	ldr r1, number
	add r2, r1, r2
	ldrb r1, [r2, #0x1B]
	mov r2, #0xF0
	and r1, r2
	cmp r1, #0x0
	beq exit
	cmp r1, #0x10
	bne exit
	push {r0}
	ldr r1, [r6, #0x0]
	ldr r3, number1
	add r1, r1, r3
	mov r0, #0xC
	strb r0, [r1, #0x0]
	mov r0, #0x2
	strb r0, [r1, #0x1]
	b there
meloettacode:	ldr r2, partystart
	ldr r2, [r2, #0x0]
	ldr r1, number
	add r2, r1, r2
	ldrb r1, [r2, #0x1B]
	mov r2, #0xF0
	and r1, r2
	cmp r1, #0x0
	beq exit
	cmp r1, #0x10
	bne exit
	push {r0}
	ldr r1, [r6, #0x0]
	ldr r3, number1
	add r1, r1, r3
	mov r0, #0x0
	strb r0, [r1, #0x0]
	mov r0, #0x1
	strb r0, [r1, #0x1]
	b there
.align
return:		.word 0x081361A1
number:		.word 0x00003290
number1:	.word 0x00003220
partystart:	.word 0x0203B140
wormadam:	.word 0x0000019D
statusbyteloc:	.word 0x0203C000
meloetta:	.word 0x00000288
