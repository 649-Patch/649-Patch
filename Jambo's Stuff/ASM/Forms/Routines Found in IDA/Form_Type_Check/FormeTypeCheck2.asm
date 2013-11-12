.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r2, arceus
	cmp r2, r4
	beq multiitemcode
	mov r2, #0xF6
	lsl r2, r2, #0x1
	cmp r2, r4
	beq shaymincode
	ldr r2, giratina
	cmp r2, r4
	bne exit
	b exit
multiitemcode:	ldr r2, partystart
	ldr r2, [r2, #0x0]
	ldr r1, number
	push {r0}
	add r0, r2, r1
	mov r1, #0xC
	bl decrypt
	sub r0, #0xE1
back:	cmp r0, #0x1
	blt exit2
	cmp r0, #0x9
	beq exit2
	cmp r0, #0x11
	bgt exit2
	ldr r1, [r6, #0x0]
	ldr r3, number1
	add r1, r1, r3
	strb r0, [r1, #0x0]
	strb r0, [r1, #0x1]
there:	pop {r0}
there2:	ldr r0, return
	bx r0
shaymincode:	ldr r2, partystart
	ldr r2, [r2, #0x0]
	ldr r1, number
	push {r0}
	add r0, r2, r1
	mov r1, #0xC
	bl decrypt
	cmp r0, #0xEA
	bne exit2
	ldr r1, [r6, #0x0]
	ldr r3, number1
	add r1, r1, r3
	mov r0, #0xC
	strb r0, [r1, #0x0]
	mov r0, #0x2
	strb r0, [r1, #0x1]
	b there
exit2:	pop {r0}
exit:	ldrb r2, [r0, #0x6]
	ldr r1, [r6, #0x0]
	ldr r3, number1
	add r1, r1, r3
	strb r2, [r1, #0x0]
	ldrb r0, [r0, #0x7]
	strb r0, [r1, #0x1]
	b there2
decrypt:	ldr r2, decry
	bx r2
.align
arceus:	.word 0x000001ED
giratina:	.word 0x000001E7
partystart:	.word 0x0203B140
number:		.word 0x00003290
number1:	.word 0x00003220
return:		.word 0x081361A1
decry:		.word 0x0803FBE9
