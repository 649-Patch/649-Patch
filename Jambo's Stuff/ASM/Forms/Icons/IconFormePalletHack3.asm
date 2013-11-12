.text
.align 2
.thumb
.thumb_func
.global iconformehack1

main:
	push {r0-r7}
	mov r0, r11
	mov r1, #0x2D
	bl decrypt
	cmp r0, #0x1
	beq eggsprite
	pop {r0-r7}
	mov r1, r11
	cmp r1, #0x0
	beq male
	ldrb r1, [r1, #0x1B]
	mov r2, #0xF0
	and r1, r2
	cmp r1, #0x20
	beq female
male:	pop {r0-r3}
	ldrb r0, [r0, #0x0]
	b continue
female:	pop {r0-r3}
	ldrb r0, [r5, #0x3]
continue:	mov r5, #0x0
	mov r11, r5
	ldr r5, number
	ldr r1, return
	bx r1
eggsprite:	mov r0, r11
	mov r1, #0xB
	bl decrypt
	ldr r1, phione
	bne normalegg
	pop {r0-r7}
	pop {r0-r3}
	mov r0, #0x2
	b continue
normalegg:	pop {r0-r7}
	pop {r0-r3}
	mov r0, #0x1
	b continue
decrypt:	ldr r2, decry
	bx r2
.align
pokemondata:	.word 0x0871BEA0
number:		.word 0x0000DAC0
return:		.word 0x08096E63
decry:		.word 0x0803FBE9
phione:		.word 0x000001E9
