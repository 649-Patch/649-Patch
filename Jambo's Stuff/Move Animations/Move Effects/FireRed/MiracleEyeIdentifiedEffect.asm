.text
.align 2
.thumb
.thumb_func
.global miracleeye2

main:
	ldr r0, place
	ldrb r0, [r0, #0x1]
	lsl r0, r0, #0x2
	ldr r1, ramlocation
	add r0, r0, r1
	ldr r1, [r0, #0x0]
	mov r2, #0x1
	lsl r2, r2, #0x13
	orr r1, r2
	str r1, [r0, #0x0]
	bx lr
.align
place:	.word 0x02023D6B
ramlocation:	.word 0x02023DFC
