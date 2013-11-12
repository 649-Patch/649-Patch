.text
.align 2
.thumb
.thumb_func
.global growth

main:
	ldr r0, weather
	ldr r0, [r0, #0x0]
	mov r1, #0x60
	and r0, r1
	cmp r0, #0x0
	bne alt
	mov r2, #0x1
	b continue
alt:	mov r2, #0x2
continue:	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	mov r5, #0x0
	ldrb r3, [r0, #0x1]
	ldrb r4, [r0, #0x4]
	cmp r3, #0xC
	bne next
	mov r6, #0x1
	orr r5, r6
next:	cmp r4, #0xC
	bne next2
	mov r6, #0x2
	orr r5, r6
next2:	cmp r5, #0x3
	beq fail
	add r3, r3, r2
	add r4, r4, r2
	cmp r3, #0xC
	blt next3
	mov r3, #0xC
next3:	cmp r4, #0xC
	blt next4
	mov r4, #0xC
next4:	strb r3, [r0, #0x1]
	strb r4, [r0, #0x4]
	ldr r3, textramloc
	cmp r5, #0x0
	bne next5
there:	ldr r4, textone
	b store
next5:	cmp r5, #0x1
	bne next6
	ldr r4, textthree
	b store
next6:	cmp r5, #0x2
	bne there
	ldr r4, texttwo
store:	str r4, [r3, #0x0]
	bx lr
fail:	ldr r0, scriptloc
	ldr r1, failed
	str r1, [r0, #0x0]
	bx lr
.align
weather:	.word 0x02023F1C
place:	.word 0x02023D6B
place2:	.word 0x02023BFC
textramloc:	.word 0x0203C020
textone:	.word 0x08766D57
texttwo:	.word 0x08766D80
textthree:	.word 0x08766D9D
scriptloc:	.word 0x02023D74
failed:	.word 0x08761713
