.text
.align 2
.thumb
.thumb_func
.global quickfeet1

main:
	add r0, r4, #0x0
	push {r1-r7}
	add r2, r0, #0x0
	add r0, #0x20
	add r2, #0x4C
	ldrb r0, [r0, #0x0]
	cmp r0, #0x5F
	bne skip
	ldr r2, [r2, #0x0]
	cmp r2, #0x0
	beq skip
	mov r1, #0x96
	ldrh r0, [r4, #0x6]
	mul r0, r1
	mov r1, #0x64
	bl div
	pop {r1-r7}
	add r3, r0, #0x0
	b continue
skip:	pop {r1-r7}
	ldrh r0, [r4, #0x6]
	mul r7, r0
	add r3, r7, #0x0
continue:	ldr r2, dead
	mov r1, #0x1B
	ldrh r1, [r4, r1]
	lsl r1, r1, #0x1
	add r0, r1, r2
	ldrb r0, [r0, #0x0]
	mul r0, r3
	add r2, #0x1
	add r1, r1, r2
	ldrb r1, [r1, #0x0]
	bl div
	add r7, r0, #0x0
	ldr r0, return
	bx r0
div:	ldr r2, divmod
	bx r2
.align
dead:	.word 0x0825DEAD
return:	.word 0x08014EAD
divmod:	.word 0x081E4019