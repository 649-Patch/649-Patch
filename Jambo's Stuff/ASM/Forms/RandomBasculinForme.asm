.text
.align 2
.thumb
.thumb_func
.global basculinrandomchance

main:
	add r0, r7, #0x0
	mov r1, #0xB
	bl decrypt
	ldr r1, basculin
	cmp r0, r1
	beq basculincode
	mov r1, #0xCE
	lsl r1, r1, #0x1
	cmp r0, r1
	beq burmy
	b skip
basculincode:	bl random
	mov r1, #0x1
	and r0, r1
	cmp r0, #0x0
	beq skip
there:	lsl r0, r0, #0x4
	add r7, #0x1B
	ldrb r1, [r7, #0x0]
	mov r3, #0xF
	and r1, r3
	orr r0, r1
	strb r0, [r7, #0x0]
	sub r7, #0x1B
	b skip
burmy:	push {r1-r7}
	bl terrainget
	pop {r1-r7}
	cmp r0, #0x2
	beq sandy
	cmp r0, #0x7
	beq sandy
	cmp r0, #0x8
	beq trash
	cmp r0, #0x9
	beq trash
	b skip
sandy:	mov r0, #0x1
	b there
trash:	mov r0, #0x2
	b there
skip:	add sp, #0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
decrypt:	ldr r2, decry
	bx r2
random:	ldr r2, randomiser
	bx r2
terrainget:	ldr r0, getterrain
	bx r0
.align
basculin:	.word 0x00000226
decry:	.word 0x0803FBE9
randomiser:	.word 0x08044EC9
getterrain:	.word 0x0807FC5D
