.text
.align 2
.thumb
.thumb_func
.global battlescriptclearspecialstatusbit

main:
earlier:	push {r1-r7,lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r4, r0, #0x0
	add r1, r0, #0x0
	add r1, #0x6
	str r1, [r5, #0x0]
	ldrb r0, [r0, #0x1]
	bl bankdecrypt
	lsl r0, r0, #0x2
	ldr r1, battledata
	add r0, r0, r1
	ldr r1, [r0, #0x0]
	add r2, r0, #0x0
	add r0, r4, #0x2
	bl getword
	bic r1, r0
	str r1, [r2, #0x0]
	pop {r1-r7,pc}
bankdecrypt:	ldr r2, place
	bx r2
.align
scriptlocation:	.word 0x02023D74
battledata:	.word 0x02023DFC
place:	.word 0x08016E25
