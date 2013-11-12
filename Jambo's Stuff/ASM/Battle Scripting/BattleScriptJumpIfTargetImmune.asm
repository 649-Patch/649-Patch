.text
.align 2
.thumb
.thumb_func
.global battlescriptjumpiftargetimmune

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
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldrb r1, [r0, #0x0]
	ldrb r2, [r0, #0x1]
	ldr r3, place3
	ldrh r3, [r3, #0x0]
	lsl r0, r3, #0x1
	add r0, r0, r3
	lsl r0, r0, #0x2
	ldr r3, movetable
	add r0, r0, r3
	ldrb r0, [r0, #0x1]
	bl checkmoveeffectiveness
	cmp r0, #0x0
	bne success
	str r7, [r5, #0x0]
success:	pop {pc}
checkmoveeffectiveness:	ldr r3, place4
	bx r3
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023C05
place3:	.word 0x02023D4A
movetable:	.word 0x087453D4
place4:	.word 0x08FFFFFF