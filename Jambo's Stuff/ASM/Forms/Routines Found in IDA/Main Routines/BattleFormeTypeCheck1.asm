.text
.align 2
.thumb
.thumb_func
.global battletypehacks

main:
	ldrh r1, [r2, #0x0]
	ldr r0, formetable
	push {r3,r5,r6}
	mov r6, #0x0
loop:	lsl r5, r6, #0x2
	add r5, r5, r0
	ldrh r3, [r5, #0x0]
	cmp r3, r1
	beq exitloop
	ldr r5, exit
	cmp r3, r5
	beq exit2
	add r6, #0x1
	b loop
exitloop:	ldrb r0, [r5, #0x2]
	cmp r0, #0x0
	beq exit2
	ldr r3, formechecktable
	lsl r0, r0, #0x2
	add r0, r0, r3
	ldr r0, [r0, #0x0]
	pop {r3,r5,r6}
	mov pc, r0
exit2:	pop {r3,r5,r6}
	lsl r0, r1, #0x3
	sub r0, r0, r1
	lsl r0, r0, #0x2
	add r0, r0, r6
	ldrb r0, [r0, #0x6]
	add r2, #0x21
	strb r0, [r2, #0x0]
	ldr r2, return
	bx r2
.align
formetable:	.word 0x08FFFFFF
formechecktable:	.word 0x08FFFFFF
exit:	.word 0x0000FEFE
return:	.word 0x0801312B