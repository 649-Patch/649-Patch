.text
.align 2
.thumb
.thumb_func
.global worryseed

main:
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r1, r0
	add r0, #0x20
	mov r1, #0x0
	strb r1, [r0, #0x0]
	mov r1, #0x0
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
