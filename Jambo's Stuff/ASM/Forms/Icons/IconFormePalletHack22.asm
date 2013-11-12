.text
.align 2
.thumb
.thumb_func
.global iconformehack1

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
.align
pokemondata:	.word 0x0871BEA0
number:		.word 0x0000DAC0
return:	.word 0x08091331
data:	.word 0x0873E16C
