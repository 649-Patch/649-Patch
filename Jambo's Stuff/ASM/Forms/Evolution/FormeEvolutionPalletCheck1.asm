.text
.align 2
.thumb
.thumb_func
.global formetypecheck1

main:
	ldr r0, [r0, #0x0]
	push {r0,r2-r7}
	ldr r2, formetable
	mov r6, #0x0
loop:	lsl r5, r6, #0x2
	add r5, r5, r2
	ldrh r3, [r5, #0x0]
	cmp r3, r10
	beq exitloop
	ldr r5, exit
	cmp r3, r5
	beq exit2
	add r6, #0x1
	b loop
exitloop:	ldrb r1, [r5, #0x2]
	cmp r1, #0x0
	beq exit2
	pop {r0,r2-r7}
	lsl r2, r1, #0x2
	ldr r1, formechecktable
	add r2, r1, r2
	ldr r1, [r2, #0x0]
	mov pc, r1
exit2:	pop {r0,r2-r7}
	mov r1, #0x90
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
return:	.word 0x080CDFB5
place:	.word 0x080703A9
