.text
.align 2
.thumb
.thumb_func
.global simpleandcontrary

main:
	ldr r0, place
	ldrb r0, [r0, #0x1]
	ldr r2, ramaddress
	strb r0, [r2, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r1, r0, r1
	add r1, #0x1B
	ldrb r0, [r1, #0x0]
	add r0, #0x1
	strb r0, [r1, #0x0]
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
ramaddress:	.word 0x02023D6E
