.text
.align 2
.thumb
.thumb_func
.global battlescriptjumpifcannotcaptivate

main:
	push {r1-r7,lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	ldrb r7, [r0, #0x2]
	ldrb r6, [r0, #0x3]
	lsl r6, r6, #0x8
	orr r7, r6
	ldrb r6, [r0, #0x4]
	lsl r6, r6, #0x10
	orr r7, r6
	ldrb r6, [r0, #0x5]
	lsl r6, r6, #0x18
	orr r7, r6
	add r0, #0x5
	str r0, [r5, #0x0]
	ldr r0, place
	ldrb r1, [r0, #0x1]
	ldrb r0, [r0, #0x0]
	mov r2, #0x58
	mul r0, r2
	mul r1, r2
	ldr r2, place2
	add r0, r0, r2
	add r4, r1, r2
	ldr r1, [r0, #0x48]
	ldrh r0, [r0, #0x0]
	bl getgender
	add r6, r0, #0x0
	ldr r1, [r4, #0x48]
	ldrh r0, [r4, #0x0]
	bl getgender
	cmp r6, #0xFF
	bne normalone
	b store
normalone:	cmp r0, #0xFF
	bne normaltwo
	b store
normaltwo:	cmp r0, r6
	bne success
store:	str r7, [r5, #0x0]
success:	pop {r1-r7,pc}
getgender:	ldr r2, genderget
	bx r2
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
genderget:	.word 0x08769869