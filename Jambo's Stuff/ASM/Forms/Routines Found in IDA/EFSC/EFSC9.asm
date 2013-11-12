.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, one
	cmp r0, lr
	beq battlecode
	ldr r0, partystart
	ldr r0, [r0, #0x0]
	ldr r1, number
	add r0, r1, r0
there:	ldr r0, [r0, #0x0]
	mov r1, #0xFF
	and r0, r1
	push {r2}
	mov r1, #0x1C
	mul r1, r4
	ldr r2, pokemondata
	add r1, r1, r2
	pop {r2}
	ldrb r1, [r1, #0x10]
	cmp r1, r0
	blt female
	mov r0, #0x0
	b getsprite
female:	mov r0, #0x1
getsprite:	lsl r1, r0, #0x2
	ldr r0, [r6, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	add r1, r5, #0x0
	bl place
	ldr r0, return
	bx r0
place:	ldr r3, place2
	bx r3
battlecode:	bl getspriteloc
	b there
getspriteloc:	ldr r0, getadd
	bx r0
.align
return:		.word 0x0800ED8D
place2:		.word 0x081E3B71
number:		.word 0x00003290
partystart:	.word 0x0203B140
pokemondata:	.word 0x0871BEA0
one:		.word 0x0800F129
getadd:		.word 0x0874A459
