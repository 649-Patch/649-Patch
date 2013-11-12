.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	mov r1, r11
	cmp r1, #0x0
	beq male
	ldr r1, [r1, #0x0]
	mov r2, #0xFF
	and r1, r2
	add r3, r1, #0x0
	add r1, r0, #0x0
	mov r2, #0x1C
	mul r1, r2
	ldr r2, pokemondata
	add r1, r1, r2
	ldrb r1, [r1, #0x10]
	cmp r1, r3
	blt female
male:	mov r1, #0x0
	b getsprite
female:	mov r1, #0x1
getsprite:	lsl r0, r0, #0x2
	mov r2, #0x4
	lsl r2, r2, #0x8
	mul r1, r2
	ldr r2, normaltable
	add r2, r2, r0
	ldr r2, [r2, #0x0]
	add r0, r2, r1
	pop {r1}
	bx r1
.align
normaltable:	.word 0x0873D744
pokemondata:	.word 0x0871BEA0
