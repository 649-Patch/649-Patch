.text
.align 2
.thumb
.thumb_func
.global skilllink

main:
	ldr r0, scriptloc
	ldr r0, [r0, #0x0]
	ldrb r1, [r0, #0x1]
	cmp r1, #0x0
	bne store
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldrb r0, [r0, #0x0]
	cmp r0, #0x5C
	bne normal
	mov r1, #0x5
	b store
normal:	ldr r4, return
	bx r4
store:	ldr r0, storeloc
	strb r1, [r0, #0x0]
	ldr r1, return2
	bx r1
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
scriptloc:	.word 0x02023D74
storeloc:	.word 0x02023D72
return:	.word 0x080281ED
return2:	.word 0x08028207
