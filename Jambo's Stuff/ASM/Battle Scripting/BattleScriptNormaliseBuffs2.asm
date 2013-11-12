.text
.align 2
.thumb
.thumb_func
.global battlescriptnormalisebuffs2

main:
	push {lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	ldrb r1, [r0, #0x1]
	add r0, #0x2
	str r0, [r5, #0x0]
	add r0, r1, #0x0
	bl bankdecrypt
	add r1, r0, #0x0
	mov r2, #0x58
	mul r1, r2
	ldr r2, place2
	add r1, r1, r2
	mov r3, #0x0
	ldrb r0, [r1, #0x8]
	cmp r0, #0x34
	bne skip
	ldrb r3, [r1, #0x1]
	cmp r3, #0x5
	bhi skip
	mov r3, #0x6
skip:	ldr r0, place
	str r0, [r1, #0x0]
	str r0, [r1, #0x4]
	cmp r3, #0x0
	beq skip2
	strb r3, [r1, #0x1]
skip2:	pop {pc}
bankdecrypt:	ldr r2, place3
	bx r2
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x06060606
place2:	.word 0x02023BFC
place3:	.word 0x08016E25
