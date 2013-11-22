.text
.align 2
.thumb
.thumb_func
.global battlescriptsettoxicspikeseffect

main:
	push {lr}
	mov r4, #0x30
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	ldrb r1, [r0, #0x1]
	add r0, #0x2
	str r0, [r5, #0x0]
	add r0, r1, #0x0
	bl bankdecrypt
	mov r1, #0x1
	and r0, r1
	ldr r1, place2
	lsl r2, r0, #0x1
	add r0, r0, r2
	lsl r0, r0, #0x2
	add r0, r0, r1
	ldrb r1, [r0, #0xA]
	bic r1, r4
	strb r1, [r0, #0xA]
	pop {pc}
bankdecrypt:	ldr r2, place3
	bx r2
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023DE4
place3:	.word 0x08016E25
