.text
.align 2
.thumb
.thumb_func
.global aquaring

main:
	ldr r1, andvalues
	and r1, r0
	cmp r1, #0x0
	bne jump
	bl exitcode
jump:	mov r2, #0x0
	mov r1, #0x80
	lsl r1, r1, #0x3
	and r1, r0
	cmp r1, #0x0
	beq skip
	add r2, #0x1
skip:	mov r1, #0x80
	lsl r1, r1, #0x10
	and r1, r0
	cmp r1, #0x0
	beq skip2
	add r2, #0x2
skip2:	ldr r0, place
	mov r1, #0x58
	mul r1, r3
	add r0, r1, r0
	ldrh r1, [r0, #0x28]
	ldrh r5, [r0, #0x2C]
	cmp r1, r5
	bne later
	bl exitcode
later:	cmp r1, #0x0
	bne later2
	bl exitcode
later2:	ldr r1, memorylocation
	ldrh r0, [r0, #0x2C]
	cmp r2, #0x3
	bne skip3
	lsr r0, r0, #0x3
	b continue
skip3:	lsr r0, r0, #0x4
continue:	cmp r0, #0x0
	bne skip4
	mov r0, #0x1
skip4:	neg r0, r0
	str r0, [r1, #0x0]
	sub r2, #0x1
	lsl r2, r2, #0x2
	ldr r0, table
	add r0, r0, r2
	ldr r0, [r0, #0x0]
	bl exitcode2
exitcode:	ldr r0, returnthree
	add r0, #0x8
	bx r0
exitcode2:	ldr r1, returnthree
	bx r1
.align
andvalues:	.word 0x00800400
returnone:	.word 0x08018365
place:	.word 0x02023BE4
memorylocation:	.word 0x02023D50
table:	.word 0x08FFFFFF
returnthree:	.word 0x08018C05

