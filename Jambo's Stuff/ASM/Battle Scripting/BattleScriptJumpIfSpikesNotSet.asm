.text
.align 2
.thumb
.thumb_func
.global battlescriptjumpifspikesnotset

main:
	push {lr}
	mov r4, #0x3
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
	mov r1, #0x1
	and r0, r1
	ldr r1, place2
	lsl r2, r0, #0x1
	add r0, r0, r2
	lsl r0, r0, #0x2
	add r0, r0, r1
	ldrb r0, [r0, #0xA]
	and r0, r4
	cmp r0, #0x0
	bne success
	str r7, [r5, #0x0]
success:	pop {pc}
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023DE4