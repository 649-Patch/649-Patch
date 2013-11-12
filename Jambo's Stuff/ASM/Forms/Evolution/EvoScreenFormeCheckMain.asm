.text
.align 2
.thumb
.thumb_func
.global formetypecheck1

main:
	ldr r0, formetable
	push {r3,r5,r6}
	mov r6, #0x0
loop:	lsl r5, r6, #0x2
	add r5, r5, r0
	ldrh r3, [r5, #0x0]
	cmp r3, r2
	beq exitloop
	ldr r5, exit
	cmp r3, r5
	beq exit2
	add r6, #0x1
	b loop
exitloop:	ldrb r0, [r5, #0x2]
	cmp r0, #0x0
	beq exit2
	ldr r6, formechecktable
	lsl r0, r0, #0x2
	add r0, r0, r6
	pop {r3,r5,r6}
	ldr r0, [r0, #0x0]
	add r1, r4, #0x0
	mov pc, r0
exit2:	pop {r3,r5,r6}
	ldr r0, [r3, #0x0]
	add r1, r4, #0x0
	bl place
	ldr r0, return
	bx r0
place:	ldr r6, therething
	bx r6
.align
formetable:	.word 0x08749CCC
formechecktable:	.word 0x08FFFFFF
exit:		.word 0x0000FEFE
return:		.word 0x0800ECB5
therething:	.word 0x081E3B71
