.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, one
	cmp r0, lr
	beq battlecode
	ldr r0, burmy
	cmp r0, r4
	bne exit
	ldr r0, partystart
	ldr r0, [r0, #0x0]
	ldr r1, number
	add r0, r1, r0
there:	ldrb r0, [r0, #0x1B]
	mov r1, #0xF0
	and r0, r1
	cmp r0, #0x0
	beq exit
	cmp r0, #0x10
	bne next
	ldr r0, [r6, #0x0]
	ldr r0, [r0, #0x4]
	b exit2
next:	cmp r0, #0x20
	bne exit
	ldr r0, [r6, #0x0]
	add r0, #0x8
	ldr r0, [r0, #0x0]
	b exit2
exit:	ldr r0, [r6, #0x0]
	ldr r0, [r0, #0x0]
exit2:	add r1, r4, #0x0
	bl place
	ldr r0, return
	bx r0
place:	ldr r3, place2
	bx r3
battlecode:	ldr r0, burmy
	cmp r0, r7
	bne exit
	bl getspriteloc
	b there
getspriteloc:	ldr r0, getadd
	bx r0
.align
return:		.word 0x0800F1D1
place2:		.word 0x081E3B71
partystart:	.word 0x0203B140
burmy:		.word 0x0000019C
number:		.word 0x00003290
one:		.word 0x0800F129
getadd:		.word 0x0874A459
