.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r1, unfezant
	cmp r1, r10
	beq battlecode
	ldr r1, frillish
	cmp r1, r10
	beq battlecode
	add r1, #0x1
	cmp r1, r10
	bne there
battlecode:	ldr r2, [sp, #0x30]
	ldr r2, [r2, #0x0]
	mov r1, #0xFF
	and r2, r1
	mov r1, #0x1C
	mov r3, r10
	mul r1, r3
	ldr r3, pokemondata
	add r1, r1, r3
	ldrb r1, [r1, #0x10]
	cmp r2, r1
	blt female
	mov r1, #0x0
	b getsprite
female:	mov r1, #0x1
getsprite:	lsl r1, r1, #0x2
	add r0, r0, r1
	ldr r0, [r0, #0x0]
there:	ldr r1, return
	bx r1
.align
pokemondata:	.word 0x0871BEA0
one:		.word 0x0810BD5B
unfezant:	.word 0x00000209
frillish:	.word 0x00000250
return:	.word 0x0876650D
