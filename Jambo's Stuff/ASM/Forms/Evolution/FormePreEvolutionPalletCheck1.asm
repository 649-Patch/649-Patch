.text
.align 2
.thumb
.thumb_func
.global formetypecheck1

main:
	push {r0,r2-r7}
	ldr r2, formetable
	mov r6, #0x0
loop:	lsl r7, r6, #0x2
	add r7, r7, r2
	ldrh r3, [r7, #0x0]
	cmp r3, r5
	beq exitloop
	ldr r7, exit
	cmp r3, r7
	beq exit2
	add r6, #0x1
	b loop
exitloop:	ldrb r1, [r7, #0x2]
	cmp r1, #0x0
	beq exit2
	pop {r0,r2-r7}
	lsl r2, r1, #0x2
	ldr r1, formechecktable
	add r2, r1, r2
	ldr r1, [r2, #0x0]
	mov pc, r1
exit2:	pop {r0,r2-r7}
	ldr r0, [r0, #0x0]
	mov r1, #0x88
	lsl r1, r1, #0x1
	mov r2, #0x20
	bl thing
	ldr r0, return
	bx r0
thing:	ldr r3, place
	bx r3
.align
formetable:	.word 0x08749CCC
formechecktable:	.word 0x08FFFFFF
exit:		.word 0x0000FEFE
return:	.word 0x080CDF3B
place:	.word 0x080703A9
