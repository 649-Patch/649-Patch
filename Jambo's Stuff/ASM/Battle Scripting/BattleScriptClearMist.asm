.text
.align 2
.thumb
.thumb_func
.global battlescriptclearentryhazards

main:
earlier:	push {lr}
	ldr r5, scriptlocation
	ldr r1, [r5, #0x0]
	ldrb r0, [r1, #0x1]
	add r1, #0x2
	str r1, [r5, #0x0]
	bl bankdecrypt
	mov r1, #0x1
	and r0, r1
	add r2, r0, #0x0
	lsl r0, r0, #0x1
	ldr r1, battledata
	add r0, r0, r1
	ldrh r1, [r0, #0x0]
	mov r3, #0x1
	lsl r3, r3, #0x8
	bic r1, r3
	strh r1, [r0, #0x0]
	lsl r0, r2, #0x1
	add r0, r0, r2
	lsl r0, r0, #0x2
	ldr r1, battledata2
	add r0, r0, r1
	mov r1, #0x0
	strb r1, [r0, #0x4]
	pop {pc}
bankdecrypt:	ldr r2, place
	bx r2
.align
scriptlocation:	.word 0x02023D74
battledata:	.word 0x02023DDE
battledata2:	.word 0x02023DE4
place:	.word 0x08016E25
