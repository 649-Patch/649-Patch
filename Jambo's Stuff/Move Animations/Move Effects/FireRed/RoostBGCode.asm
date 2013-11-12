.text
.align 2
.thumb
.thumb_func
.global roost

main:
	ldrb r0, [r0, #0x0]
	cmp r0, #0x2
	bne exit
	push {r1}
	mov r1, #0x1
	ldrb r4, [r7, #0x0]
	lsl r1, r4
	ldr r4, roostramlocation
	ldrb r4, [r4, #0x0]
	and r4, r1
	cmp r4, #0x0
	beq exit2
	mov r0, #0x0
exit2:	pop {r1}
exit:	ldrb r4, [r1, #0x0]
	cmp r4, r0
	bne notsame
	add r0, r3, #0x2
	add r0, r0, r5
	ldrb r0, [r0, #0x0]
	str r2, [sp, #0x0]
	str r3, [sp, #0x4]
	bl place
	ldr r3, [sp, #0x4]
	ldr r2, [sp, #0x0]
notsame:	ldrb r0, [r7, #0x0]
	mul r0, r6
	add r0, r0, r2
	add r1, r0, #0x0
	add r1, #0x22
	ldrb r1, [r1, #0x0]
	cmp r1, #0x2
	bne skip2
	push {r1,r4}
	mov r1, #0x1
	ldrb r4, [r7, #0x0]
	lsl r1, r4
	ldr r4, roostramlocation
	ldrb r4, [r4, #0x0]
	and r4, r1
	cmp r4, #0x0
	beq skip
	pop {r1,r4}
	mov r1, #0x0
	b skip2
skip:	pop {r1,r4}
skip2:	cmp r4, r1
	bne notsame2
	add r0, #0x21
	ldrb r0, [r0, #0x0]
	cmp r0, #0x2
	bne exit3
	push {r1,r4}
	mov r1, #0x1
	ldrb r4, [r7, #0x0]
	lsl r1, r4
	ldr r4, roostramlocation
	ldrb r4, [r4, #0x0]
	and r4, r1
	cmp r4, #0x0
	beq exit4
	mov r0, #0x0
exit4:	pop {r1,r4}
exit3:	cmp r0, r4
	bne notsame2
	ldr r0, return2
	bx r0
notsame2:	add r3, #0x3
	ldr r5, return
	bx r5
place:	ldr r1, placethere
	bx r1
.align
roostramlocation:	.word 0x0203D801
return:	.word 0x0801E9AB
return2:	.word 0x0801E99B
placethere:	.word 0x0801E771
