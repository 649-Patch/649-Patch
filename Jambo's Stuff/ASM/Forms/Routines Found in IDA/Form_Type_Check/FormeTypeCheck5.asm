.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r2, darmanitan
	cmp r2, r4
	bne exit
	ldr r2, partystart
	ldr r2, [r2, #0x0]
	ldr r1, number
	push {r0}
	add r0, r2, r1
	mov r9, r0
	mov r1, #0xB
	bl decrypt
	mov r10, r0
	mov r0, r9
	mov r1, #0x2E
	bl decrypt
	add r1, r0, #0x0
	mov r0, r10
	bl getability
	add r1, r0, #0x0
	mov r0, #0x0
	mov r0, r10
	pop {r0}
	cmp r1, #0xA1
	bne exit
	push {r0}
	mov r0, r9
	mov r1, #0x3A
	bl decrypt
	lsr r0, r0, #0x1
	mov r10, r0
	mov r0, r9
	mov r1, #0x39
	bl decrypt
	add r1, r0, #0x0
	mov r2, r10
	mov r0, #0x0
	mov r10, r0
	mov r9, r0
	pop {r0}
	cmp r1, r2
	bge exit
	ldr r1, [r6, #0x0]
	ldr r3, number1
	add r1, r1, r3
	mov r0, #0xA
	strb r0, [r1, #0x0]
	mov r0, #0xE
	strb r0, [r1, #0x1]
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
decrypt:	ldr r2, decry
	bx r2
getability:	ldr r2, abilget
	bx r2
.align
darmanitan:	.word 0x0000022B
partystart:	.word 0x0203B140
number:		.word 0x00003290
number1:	.word 0x00003220
return:		.word 0x081361A1
decry:		.word 0x0803FBE9
abilget:	.word 0x08040D39
