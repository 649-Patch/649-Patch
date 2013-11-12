.text
.align 2
.thumb
.thumb_func
.global guardswap

main:
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r1, r0
	ldrh r2, [r0, #0xA]
	ldrh r1, [r0, #0x4]
	strh r1, [r0, #0xA]
	strh r2, [r0, #0x4]
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
