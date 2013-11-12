.text
.align 2
.thumb
.thumb_func
.global guardsplit

main:
	ldr r0, place
	ldrb r1, [r0, #0x0]
	ldrb r0, [r0, #0x1]
	mov r2, #0x58
	mul r0, r2
	mul r1, r2
	ldr r2, place2
	add r0, r2, r0
	add r1, r2, r1
	ldrh r2, [r0, #0xA]
	ldrh r3, [r0, #0x4]
	ldrh r4, [r1, #0xA]
	ldrh r5, [r1, #0x4]
	add r2, r2, r4
	add r3, r3, r5
	lsr r2, r2, #0x1
	lsr r3, r3, #0x1
	strh r2, [r0, #0xA]
	strh r2, [r1, #0xA]
	strh r3, [r0, #0x4]
	strh r3, [r1, #0x4]
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
