.text
.align 2
.thumb
.thumb_func
.global malefemaleformeone

main:
	mov r0, r11
	cmp r0, #0xFF
	bne skip
	mov r0, #0x0
	b getsprite
skip:	cmp r0, #0x1
	bne skip2
	mov r0, #0x0
	b getsprite
skip2:	add r0, r5, #0x0
	mov r1, #0xFF
	and r0, r1
	push {r2}
	mov r1, #0x1C
	mul r1, r7
	ldr r2, pokemondata
	add r1, r1, r2
	pop {r2}
	ldrb r1, [r1, #0x10]
	cmp r0, r1
	blt female
	mov r0, #0x0
	b getsprite
female:	mov r0, #0x1
getsprite:	lsl r0, r0, #0x2
	ldr r1, [r6, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	ldr r1, return
	bx r1
.align
return:	.word 0x0874B4A5
pokemondata:	.word 0x0871BEA0
