.text
.align 2
.thumb
.thumb_func
.global afteryou

main:
	ldr r0, place
	ldrb r1, [r0, #0x1]
	ldrb r0, [r0, #0x0]
	ldr r2, place3
	ldrb r3, [r2, #0x4]
	cmp r3, #0x3
	bge itfailed
	mov r3, #0x0
	mov r4, #0x4
	mov r5, #0x4
loop:	add r6, r3, r2
	ldrb r6, [r6, #0x0]
	cmp r6, r1
	bne no
	add r5, r3, #0x0
no:	cmp r6, r0
	bne no2
	add r4, r3, #0x0
no2:	cmp r4, #0x4
	beq skip
	cmp r5, #0x4
	bne exit
skip:	add r3, #0x1
	b loop
exit:	cmp r5, r4
	blt itfailed
loop2:	sub r0, r5, r4
	cmp r0, #0x1
	beq finished
	add r6, r2, r5
	sub r7, r6, #0x1
	ldrb r0, [r6, #0x0]
	ldrb r1, [r7, #0x0]
	strb r1, [r6, #0x0]
	strb r0, [r7, #0x0]
	sub r5, #0x1
	b loop2
finished:	bx lr
itfailed:	ldr r0, scriptloc
	ldr r1, gothere
	str r1, [r0, #0x0]
	bx lr
.align
place:	.word 0x02023D6B
place3:	.word 0x02023BDE
scriptloc:	.word 0x02023D74
gothere:	.word 0x08761713
