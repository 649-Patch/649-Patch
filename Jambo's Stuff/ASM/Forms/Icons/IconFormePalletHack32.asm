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
male:	pop {r0-r5}
	ldr r1, data
	add r1, r6, r1
	ldrb r1, [r1, #0x0]
there:	ldr r0, number
	add r0, r0, r1
	strh r0, [r2, #0x2]
	ldr r0, return
	bx r0
female:	ldrb r7, [r5, #0x3]
	pop {r0-r5}
	add r1, r7, #0x0
	b there
eggsprite:	mov r0, r11
	mov r1, #0xB
	bl decrypt
	ldr r1, phione
	bne normalegg
	pop {r0-r7}
	pop {r0-r5}
	mov r1, #0x2
	b there
normalegg:	pop {r0-r7}
	pop {r0-r5}
	mov r1, #0x1
	b there
decrypt:	ldr r2, decry
	bx r2
.align
pokemondata:	.word 0x0871BEA0
number:		.word 0x0000DAC0
return:	.word 0x08091331
data:	.word 0x0873E16C
decry:		.word 0x0803FBE9
phione:		.word 0x000001E9
