.text
.align 2
.thumb
.thumb_func
.global entrainment
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
	ldrb r2, [r0, #0x0]
	ldrb r3, [r1, #0x0]
	cmp r2, r3
	bne multitypecheckone
	mov r1, #0x3
	b store
multitypecheckone:	cmp r3, #0x79
	beq doesntworkonthese
	cmp r3, #0x36
	beq doesntworkonthese
	cmp r3, #0xA1
	beq doesntworkonthese
	b multitypechecktwo
doesntworkonthese:	mov r1, #0x2
	b store
multitypechecktwo:	cmp r2, #0x79
	beq doesntworkonthese2
	cmp r2, #0x36
	beq doesntworkonthese2
	cmp r2, #0xA1
	beq doesntworkonthese2
	b works
doesntworkonthese2:	mov r1, #0x1
	b store
works:	strb r2, [r1, #0x0]
	mov r1, #0x0
store:	ldr r0, lastresult
	strh r1, [r0, #0x0]
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
lastresult:	.word 0x020370D0
