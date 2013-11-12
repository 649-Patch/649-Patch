.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, one
	cmp r0, lr
	bne battlecode
	ldr r0, rotom
	cmp r0, r4
	bne exit
	ldr r0, placaaat
	ldr r0, [r0, #0x0]
	ldr r1, dexloc
	cmp r0, r1
	bne jumpety
	b exit
jumpety:	ldr r0, partystart
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
	bne next2
	ldr r0, [r6, #0x0]
	add r0, #0x8
	ldr r0, [r0, #0x0]
	b exit2
next2:	cmp r0, #0x40
	bne next3
	ldr r0, [r6, #0x0]
	add r0, #0xC
	ldr r0, [r0, #0x0]
	b exit2
next3:	cmp r0, #0x80
	bne next4
	ldr r0, [r6, #0x0]
	add r0, #0x10
	ldr r0, [r0, #0x0]
	b exit2
next4:	cmp r0, #0x30
	bne exit
	ldr r0, [r6, #0x0]
	add r0, #0x14
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
battlecode:	ldr r0, rotom
	cmp r0, r2
	bne exit
	mov r0, r11
	push {r0}
	mov r0, #0x0
	mov r11, r0
	pop {r0}
	b there
.align
return:		.word 0x0800ED8D
place2:		.word 0x081E3B71
number:		.word 0x00003290
partystart:	.word 0x0203B140
rotom:		.word 0x000001DF
one:		.word 0x0810BC0B
placaaat:	.word 0x020033C4
dexloc:		.word 0x02003400
