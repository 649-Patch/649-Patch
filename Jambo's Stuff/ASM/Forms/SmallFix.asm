.text
.align 2
.thumb
.thumb_func
.global smallfix

main:
	ldr r1, sprites
	add r2, r0, r1
	ldrb r0, [r2, #0x0]
	lsl r0, r0, #0x1F
	cmp r0, #0x0
	beq nocollision
	cmp r2, r6
	beq nocollision
	ldr r0, sprites
	cmp r6, r0
	bne there
	ldrb r0, [r2, #0x8]
	cmp r0, #0xFE
	beq nocollision
there:	ldrh r1, [r2, #0x10]
	lsl r0, r7, #0x10
	ldr r3, return
	bx r3
nocollision:	ldr r0, return2
	bx r0
.align
sprites:	.word 0x02036E38
return:		.word 0x0806392F
return2:	.word 0x0806396D
	