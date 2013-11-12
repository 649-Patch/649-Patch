.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r2, rotom
	cmp r2, r4
	bne exit
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
	bne next
	push {r0}
	ldr r1, [r6, #0x0]
	ldr r3, number1
	add r1, r1, r3
	mov r0, #0xD
	strb r0, [r1, #0x0]
	mov r0, #0xA
	strb r0, [r1, #0x1]
	b there
next:	cmp r1, #0x20
	bne next2
	push {r0}
	ldr r1, [r6, #0x0]
	ldr r3, number1
	add r1, r1, r3
	mov r0, #0xD
	strb r0, [r1, #0x0]
	mov r0, #0xB
	strb r0, [r1, #0x1]
	b there
next2:	cmp r1, #0x40
	bne next3
	push {r0}
	ldr r1, [r6, #0x0]
	ldr r3, number1
	add r1, r1, r3
	mov r0, #0xD
	strb r0, [r1, #0x0]
	mov r0, #0xF
	strb r0, [r1, #0x1]
	b there
next3:	cmp r1, #0x80
	bne next4
	push {r0}
	ldr r1, [r6, #0x0]
	ldr r3, number1
	add r1, r1, r3
	mov r0, #0xD
	strb r0, [r1, #0x0]
	mov r0, #0x2
	strb r0, [r1, #0x1]
	b there
next4:	cmp r1, #0x30
	bne exit
	push {r0}
	ldr r1, [r6, #0x0]
	ldr r3, number1
	add r1, r1, r3
	mov r0, #0xD
	strb r0, [r1, #0x0]
	mov r0, #0xC
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
.align
return:		.word 0x081361A1
number:		.word 0x00003290
number1:	.word 0x00003220
partystart:	.word 0x0203B140
rotom:		.word 0x000001DF
