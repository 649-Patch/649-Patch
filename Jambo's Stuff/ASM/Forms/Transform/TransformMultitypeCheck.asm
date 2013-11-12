.text
.align 2
.thumb
.thumb_func
.global transformfix
main:
	ldr r0, place
	ldrb r1, [r0, #0x1]
	ldrb r0, [r0, #0x0]
	mov r2, #0x58
	mul r0, r2
	mul r1, r2
	ldr r2, place2
	add r0, r0, r2
	add r1, r1, r2
	ldrb r0, [r0, #0x0]
	ldrb r1, [r1, #0x0]
	cmp r0, #0x79
	bne nextcheck
	b fail
nextcheck:	cmp r1, #0x79
	bne works
fail:	mov r1, #0x1
	b store
works:	mov r1, #0x0
store:	ldr r0, lastresult
	strh r1, [r0, #0x0]
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
lastresult:	.word 0x020370D0
