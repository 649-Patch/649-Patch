.text
.align 2
.thumb
.thumb_func
.global leafguard

main:
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldr r1, safeloc
	ldr r2, [r1, #0x0]
	str r2, [r0, #0x4C]
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
safeloc:	.word 0x0203D000
