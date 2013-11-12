.text
.align 2
.thumb
.thumb_func
.global bigpecksroutine

main:
	mov r4, #0x58
	mul r0, r4
	add r0, r10
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	cmp r0, #0x33
	beq keeneye
	cmp r0, #0x91
	beq bigpecks
exit:	ldr r4, returnone
	bx r4
keeneye:	mov r2, r9
	cmp r2, #0x0
	bne exit
	cmp r7, #0x6
	bne exit
	cmp r5, #0x1
	bne exit2
exit3:	ldr r0, returntwo
	bx r0
bigpecks:	mov r2, r9
	cmp r2, #0x0
	bne exit
	cmp r7, #0x2
	bne exit
	cmp r5, #0x1
	bne exit2
	b exit3
exit2:	mov r0, #0x1
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
.align
returnone:	.word 0x08027E6D
returntwo:	.word 0x08027E2D
