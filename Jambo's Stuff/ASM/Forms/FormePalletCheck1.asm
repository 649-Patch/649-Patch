.text
.align 2
.thumb
.thumb_func
.global formetypecheck1

main:
	ldr r0, place
	lsl r1, r4, #0x3
	add r1, r1, r0
	push {r1-r7}
	ldr r2, formetable
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
exitloop:	ldrb r0, [r5, #0x2]
	cmp r0, #0x0
	beq exit2
	pop {r1-r7}
	lsl r2, r0, #0x2
	ldr r0, formechecktable
	add r2, r0, r2
	ldr r0, [r2, #0x0]
	mov pc, r0
exit2:	pop {r1-r7}
	ldr r0, [r1, #0x0]
	pop {r4,r5}
	pop {r1}
	bx r1
.align
place:	.word 0x08728808
formetable:	.word 0x08749CCC
formechecktable:	.word 0x08FFFFFF
exit:		.word 0x0000FEFE
