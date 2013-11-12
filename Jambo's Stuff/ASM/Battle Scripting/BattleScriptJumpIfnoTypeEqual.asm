.text
.align 2
.thumb
.thumb_func
.global battlescriptjumpifnotypeequal

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
	ldrb r2, [r0, #0x0]
	ldrb r1, [r0, #0x1]
	mov r3, #0x58
	mul r1, r3
	mul r2, r3
	ldr r0, place2
	add r1, r1, r0
	add r2, r2, r0
	ldrb r3, [r2, #0x0]
	ldrb r4, [r1, #0x0]
	ldrb r6, [r1, #0x1]
	cmp r3, r4
	beq success
	cmp r3, r6
	beq success
	ldrb r3, [r2, #0x1]
	cmp r3, r4
	beq success
	cmp r3, r6
	beq success
	str r7, [r5, #0x0]
success:	pop {pc}
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023C05