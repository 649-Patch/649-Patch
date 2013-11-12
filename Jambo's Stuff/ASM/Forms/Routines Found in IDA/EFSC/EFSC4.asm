.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, one
	cmp r0, lr
	beq battlecode
	ldr r0, wormadam
	cmp r0, r4
	beq next3
	mov r0, #0xF6
	lsl r0, r0, #0x1
	cmp r0, r4
	beq shaymincode
	ldr r0, meloetta
	cmp r0, r4
	bne exit
	b meloettacode
next3:	ldr r0, partystart
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
shaymincode:	ldr r0, statusbyteloc
	ldrb r0, [r0, #0x0]
	cmp r0, #0x4
	bge exit
	cmp r0, #0x1
	blt exit
	ldr r0, partystart
	ldr r0, [r0, #0x0]
	ldr r1, number
	add r0, r1, r0
there2:	ldrb r0, [r0, #0x1B]
	mov r0, #0xF0
	and r0, r1
	cmp r0, #0x0
	beq exit
	cmp r0, #0x10
	bne exit
	ldr r0, [r6, #0x0]
	ldr r0, [r0, #0x4]
	b exit2
meloettacode:	ldr r0, partystart
	ldr r0, [r0, #0x0]
	ldr r1, number
	add r0, r1, r0
there3:	ldrb r0, [r0, #0x1B]
	mov r0, #0xF0
	and r0, r1
	cmp r0, #0x0
	beq exit
	cmp r0, #0x10
	bne exit
	ldr r0, [r6, #0x0]
	ldr r0, [r0, #0x4]
	b exit2
battlecode:	ldr r0, wormadam
	cmp r0, r7
	bne nextcheck
	mov r0, r11
	bl getspriteloc
	b there
nextcheck:	mov r0, #0xF6
	lsl r0, r0, #0x1
	cmp r0, r7
	bne lastcheck
	bl getspriteloc
	push {r0}
	mov r0, #0x0
	mov r11, r0
	ldr r0, statusbyteloc
	ldrb r0, [r0, #0x0]
	cmp r0, #0x4
	bge exit3
	cmp r0, #0x1
	blt exit3
	b there2
exit3:	pop {r0}
	b exit
lastcheck:	ldr r0, meloetta
	cmp r0, r7
	bne exit
	bl getspriteloc
	b there3
getspriteloc:	ldr r0, getadd
	bx r0
.align
return:		.word 0x0800F1D1
place2:		.word 0x081E3B71
number:		.word 0x00003290
partystart:	.word 0x0203B140
wormadam:	.word 0x0000019D
statusbyteloc:	.word 0x0203C000
meloetta:	.word 0x00000288
one:		.word 0x0800F129
getadd:		.word 0x0874A459
