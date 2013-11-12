.text
.align 2
.thumb
.thumb_func
.global formetypecheck1

main:
	ldr r2, formetable
	push {r3,r5,r6}
	mov r6, #0x0
loop:	lsl r5, r6, #0x2
	add r5, r5, r2
	ldrh r3, [r5, #0x0]
	cmp r3, r4
	beq exitloop
	ldr r5, exit
	cmp r3, r5
	beq exit2
	add r6, #0x1
	b loop
exitloop:	ldrb r2, [r3, #0x2]
	cmp r2, #0x0
	beq exit2
	pop {r3,r5,r6}
	ldr r1, formechecktable
	lsl r2, r2, #0x2
	add r2, r1, r2
	ldr r1, [r6, #0x0]
	ldr r2, [r2, #0x0]
	mov pc, r2
exit2:	pop {r3,r5,r6}
	ldr r1, [r6, #0x0]
	ldrb r2, [r0, #0x6]
	ldr r3, number1
	add r1, r1, r3
	strb r2, [r1, #0x0]
	ldr r1, [r6, #0x0]
	ldrb r0, [r0, #0x7]
	ldr r2, return
	bx r2
.align
formetable:	.word 0x08749CCC
formechecktable:	.word 0x08FFFFFF
exit:		.word 0x0000FEFE
number1:	.word 0x00003220
return:		.word 0x0813619B
