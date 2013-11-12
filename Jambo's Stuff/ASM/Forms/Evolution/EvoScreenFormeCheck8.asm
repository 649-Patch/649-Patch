.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	mov r0, r9
	mov r1, #0xFF
	and r0, r1
	mov r1, #0x1C
	push {r5}
	mul r1, r5
	ldr r5, pokemondata
	add r1, r1, r5
	ldrb r1, [r1, #0x10]
	pop {r5}
	cmp r1, r0
	blt female
	mov r0, #0x0
	b getsprite
female:	mov r0, #0x1
getsprite:	lsl r1, r0, #0x2
	ldr r0, [r3, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	add r1, r4, #0x0
	bl place
	ldr r0, return
	bx r0
place:	ldr r3, place2
	bx r3
.align
return:		.word 0x0800ECB5
place2:		.word 0x081E3B71
pokemondata:	.word 0x0871BEA0
