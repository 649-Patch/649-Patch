.text
.align 2
.thumb
.thumb_func
.global battlescriptjumpiftargetalreadymoved

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
	ldr r0, place
	ldrb r1, [r0, #0x1]
	ldrb r0, [r0, #0x0]
	ldr r2, place3
	ldrb r3, [r2, #0x4]
	ldr r4, place2
	ldrb r4, [r4, #0x0]
	sub r4, #0x1
	cmp r3, r4
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
exit:	cmp r4, r5
	blt success
itfailed:	ldr r5, scriptlocation
	str r7, [r5, #0x0]
success:	pop {pc}
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023BCC
place3:	.word 0x02023BDE