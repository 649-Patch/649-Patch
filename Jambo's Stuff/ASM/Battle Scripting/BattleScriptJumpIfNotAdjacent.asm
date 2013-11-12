.text
.align 2
.thumb
.thumb_func
.global battlescriptjumpifnotadjacent

main:
	push {lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	ldrb r7, [r0, #0x1]
	ldrb r6, [r0, #0x2]
	lsl r6, r6, #0x8
	orr r7, r6
	ldrb r6, [r0, #0x3]
	lsl r6, r6, #0x10
	orr r7, r6
	ldrb r6, [r0, #0x4]
	lsl r6, r6, #0x18
	orr r7, r6
	add r0, #0x5
	str r0, [r5, #0x0]
	ldr r0, place2
	ldr r0, [r0, #0x0]
	mov r1, #0x1
	and r0, r1
	cmp r0, #0x0
	beq success
	ldr r0, place
	ldrb r2, [r0, #0x0]
	ldrb r1, [r0, #0x1]
	mov r3, #0x1
	and r1, r3
	and r2, r3
	cmp r1, r2
	beq success
	ldrb r2, [r0, #0x0]
	ldrb r1, [r0, #0x1]
	mov r3, #0x2
	and r1, r3
	and r2, r3
	cmp r1, r2
	bne success
	str r7, [r5, #0x0]
success:	pop {pc}
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02022B4C