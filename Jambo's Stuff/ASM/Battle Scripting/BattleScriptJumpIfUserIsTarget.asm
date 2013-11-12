.text
.align 2
.thumb
.thumb_func
.global battlescriptjumpifuseristarget

main:
	push {r1-r7,lr}
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
	cmp r0, r1
	bne success
	str r7, [r5, #0x0]
success:	pop {r1-r7,pc}
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B