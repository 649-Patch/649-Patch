.text
.align 2
.thumb
.thumb_func
.global unnerve

main:
	push {r4-r6}
	mov r4, #0x0
	mov r6, #0x1
	and r6, r7
loop:	mov r5, #0x58
	mov r1, #0x1
	and r1, r4
	cmp r1, r6
	beq skip
	mul r5, r4
	add r5, r5, r2
	add r5, #0x20
	ldrb r5, [r5, #0x0]
	cmp r5, #0x7F
	beq noberry
skip:	ldr r5, battlebits
	ldr r5, [r5, #0x0]
	mov r1, #0x1
	and r5, r1
	cmp r5, #0x1
	bne single
	cmp r4, #0x3
	beq exitloop
	add r4, #0x1
	b loop
single:	cmp r4, #0x1
	beq exitloop
	add r4, #0x1
	b loop
noberry:	pop {r4-r6}
	ldr r0, getout
	bx r0
exitloop:	pop {r4-r6}
	lsl r0, r0, #0x2
	ldr r1, table
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	mov pc, r0
.align
getout:	.word 0x0801CDF1
table:	.word 0x0801CA64
battlebits:	.word 0x02022B4C
