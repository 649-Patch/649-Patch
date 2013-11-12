.text
.align 2
.thumb
.thumb_func
.global switcheroomodernisation

main:
	add r0, r1, #0x0
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	cmp r0, #0x3C
	bne alt
	b itfails
alt:	cmp r0, #0x79
	bne skip
	ldrh r3, [r1, #0x2E]
	bl checkplates
	cmp r3, #0x0
	beq skip
	b itfails
skip:	ldrb r3, [r6, #0x0]
	mul r3, r5
	add r3, r8
	add r3, #0x20
	ldrb r0, [r3, #0x0]
	cmp r0, #0x79
	bne skip2
	ldrh r3, [r3, #0x2E]
	bl checkplates
	cmp r3, #0x0
	beq skip2
	b itfails
skip2:	ldrh r0, [r1, #0x0]
	ldr r3, giratina
	cmp r0, r3
	bne skip3
	ldrh r0, [r1, #0x2E]
	cmp r0, #0xF7
	bne skip3
	b itfails2
skip3:	ldrb r1, [r6, #0x0]
	mul r1, r5
	add r1, r8
	ldrh r0, [r1, #0x0]
	ldr r3, giratina
	cmp r0, r3
	bne skip4
	ldrh r0, [r1, #0x2E]
	cmp r0, #0xF7
	bne skip4
	b itfails2
skip4:	ldrb r1, [r7, #0x0]
	mul r1, r5
	add r1, r8
	ldrh r0, [r1, #0x0]
	ldr r3, genesect
	cmp r0, r3
	bne skip5
	ldrh r0, [r1, #0x2E]
	bl checkdrives
	cmp r0, #0x0
	beq skip5
	b itfails2
skip5:	ldrb r1, [r6, #0x0]
	mul r1, r5
	add r1, r8
	ldrh r0, [r1, #0x0]
	ldr r3, genesect
	cmp r0, r3
	bne skip6
	ldrh r0, [r1, #0x2E]
	bl checkdrives
	cmp r0, #0x0
	beq skip6
	b itfails2
skip6:	ldr r3, returntwo
	bx r3
itfails:	ldr r3, return
	bx r3
itfails2:	ldr r3, return3
	bx r3
checkplates:	sub r3, #0xE2
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	cmp r3, #0x10
	bls checktwo
	b nofail
checktwo:	cmp r3, #0x8
	beq nofail
	mov r3, #0x1
	b end
nofail:	mov r3, #0x0
end:	bx lr
checkdrives:	sub r0, #0xF4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #0x10
	bls fail2
	b nofail2
fail2:	mov r0, #0x1
	b end2
nofail2:	mov r0, #0x0
end2:	bx lr
.align
giratina:	.word 0x000001E7
genesect:	.word 0x00000289
return:	.word 0x0802C22F
returntwo:	.word 0x0802C259
return3:	.word 0x0802C1DF
