.text
.align 2
.thumb
.thumb_func
.global iconformehack1

main:
	mov r1, r11
	cmp r1, #0x0
	beq exit2
	push {r0-r3}
	mov r1, #0x0
loop:	ldr r0, table
	lsl r2, r1, #0x2
	add r0, r0, r2
	ldrh r0, [r0, #0x0]
	cmp r0, r4
	beq exit
	ldr r2, exitcondition
	cmp r0, r2
	beq exit2
	add r1, #0x1
	b loop
exit:	ldr r0, table
	lsl r2, r1, #0x2
	add r5, r0, r2
	ldrb r0, [r5, #0x2]
	lsl r0, r0, #0x2
	ldr r1, codetable
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	mov pc, r0
exit2:	pop {r0-r3}
	ldr r5, number
	ldrb r0, [r0, #0x0]
	ldr r1, return
	bx r1
.align
table:	.word 0x08756C7C
number:	.word 0x0000DAC0
return:	.word 0x08096E63
codetable:	.word 0x08FFFFFF
exitcondition:	.word 0x0000FEFE