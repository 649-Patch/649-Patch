.text
.align 2
.thumb
.thumb_func
.global soak

main:
	ldr r0, place
	ldrb r1, [r0, #0x0]
	ldrb r0, [r0, #0x1]
	mov r2, #0x58
	mul r0, r2
	mul r1, r2
	ldr r2, place2
	add r0, r0, r2
	add r1, r1, r2
	ldrb r2, [r0, #0x1]
	strb r2, [r1, #0x1]
	ldrb r2, [r0, #0x2]
	strb r2, [r1, #0x2]
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
