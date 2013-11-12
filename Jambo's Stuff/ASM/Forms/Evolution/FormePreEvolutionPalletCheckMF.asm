.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:	add r3, r0, #0x0
	ldr r0, frillish
	cmp r0, r5
	bne exit
	ldr r0, [r4, #0x0]
	mov r1, #0xFF
	and r0, r1
	mov r1, #0x1C
	mul r1, r5
	ldr r2, pokemondata
	add r1, r1, r2
	ldrb r1, [r1, #0x10]
	cmp r0, r1
	blt female
	mov r1, #0x0
	b getsprite
female:	mov r1, #0x1
getsprite:	lsl r1, r1, #0x2
	ldr r0, [r3, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
there:	ldr r1, return
	bx r1
exit:	ldr r0, [r3, #0x0]
	b there
.align
return:		.word 0x087666AF
frillish:	.word 0x00000250
pokemondata:	.word 0x0871BEA0
