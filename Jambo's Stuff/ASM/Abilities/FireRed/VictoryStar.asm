.text
.align 2
.thumb
.thumb_func
.global simpleandcontrary

main:
	push {r0-r2}
	ldr r0, battlebits
	ldrb r0, [r0, #0x0]
	mov r1, #0x1
	and r0, r1
	cmp r0, #0x1
	beq double
	b single
double:	ldr r0, place
	ldrb r1, [r0, #0x0]
	ldr r0, place2
	mov r2, #0x1
	and r2, r1
	cmp r2, #0x0
	bne skip
	mov r1, #0x0
	mov r2, #0x2
	b skip2
skip:	mov r1, #0x1
	mov r2, #0x3
skip2:	mov r3, #0x58
	mul r2, r3
	mul r1, r3
	add r1, r1, r0
	add r2, r2, r0
	ldrb r1, [r1, #0x0]
	ldrb r2, [r2, #0x0]
	cmp r1, #0xA2
	beq multiply
	cmp r2, #0xA2
	bne exit2
multiply:	ldrb r0, [r7, #0x3]
	mov r1, #0x64
	mov r2, #0x6E
	mul r0, r2
	push {r1-r7}
	bl divide
	pop {r1-r7}
	mov r8, r0
exit:	pop {r0-r2}
	mov r0, #0x0
	str r0, [sp, #0x0]
	mov r0, #0x13
	ldr r1, return
	bx r1
single:	ldr r0, place
	ldrb r1, [r0, #0x0]
	ldr r0, place2
	mov r3, #0x58
	mul r1, r3
	add r1, r1, r0
	ldrb r1, [r1, #0x0]
	cmp r1, #0xA2
	beq multiply
exit2:	ldrb r3, [r7, #0x3]
	mov r8, r3
	b exit
divide:	ldr r2, divcode
	bx r2
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
return:	.word 0x0801DFD5
battlebits:	.word 0x02022B4C
divcode:	.word 0x081E4019
