.text
.align 2
.thumb
.thumb_func
.global soak

main:
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	mov r1, #0xB
	strb r1, [r0, #0x1]
	strb r1, [r0, #0x2]
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
