.text
.align 2
.thumb
.thumb_func
.global battlescriptstoreword

main:
	push {lr}
	push {r1-r7}
	ldr r0, scriptlocation
	ldr r0, [r0, #0x0]
	ldrb r1, [r0, #0x1]
	ldrb r2, [r0, #0x2]
	lsl r2, r2, #0x8
	orr r1, r2
	ldrb r2, [r0, #0x3]
	lsl r2, r2, #0x10
	orr r1, r2
	ldrb r2, [r0, #0x4]
	lsl r2, r2, #0x18
	orr r1, r2
	add r0, r1, #0x0
	push {r1,r2}
	mov r1, #0x4
	bl divmod
	pop {r1,r2}
	lsl r0, r0, #0x2
	cmp r0, r1
	bne exit
	ldr r0, scriptlocation
	ldr r2, [r0, #0x0]
	ldrb r3, [r2, #0x5]
	ldrb r4, [r2, #0x6]
	lsl r4, r4, #0x8
	orr r3, r4
	ldrb r4, [r2, #0x7]
	lsl r4, r4, #0x10
	orr r3, r4
	ldrb r4, [r2, #0x8]
	lsl r4, r4, #0x18
	orr r3, r4
	str r3, [r1, #0x0]
	add r2, #0x9
	str r2, [r0, #0x0]
exit:	pop {r1-r7}
	pop {r0}
	bx r0
divmod:	ldr r2, divmodlocation
	bx r2
.align
scriptlocation:	.word 0x02023D74
divmodlocation:	.word 0x081E4019
