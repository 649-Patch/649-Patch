.text
.align 2
.thumb
.thumb_func
.global battlescriptclearspecialstatusbit

main:
earlier:	push {lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r4, r0, #0x0
	add r1, r0, #0x0
	add r1, #0x4
	str r1, [r5, #0x0]
	ldrb r0, [r0, #0x1]
	bl bankdecrypt
	mov r1, #0x1
	and r0, r1
	lsl r0, r0, #0x1
	ldr r1, battledata
	add r0, r0, r1
	ldrh r1, [r0, #0x0]
	ldrb r2, [r4, #0x2]
	ldrb r3, [r4, #0x3]
	lsl r3, r3, #0x8
	orr r2, r3
	orr r1, r2
	strh r1, [r0, #0x0]
	pop {pc}
bankdecrypt:	ldr r2, place
	bx r2
.align
scriptlocation:	.word 0x02023D74
battledata:	.word 0x02023DDE
place:	.word 0x08016E25
