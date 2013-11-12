.text
.align 2
.thumb
.thumb_func
.global traceareahack

main:
	ldrb r0, [r1, #0x0]
	cmp r0, #0x24
	bne alternatives
	ldr r0, tracereturn
	bx r0
alternatives:	push {r1-r7}
	mov r3, #0x0
	ldr r1, table
loop:	lsl r2, r3, #0x3
	add r2, r2, r1
	ldrb r2, [r2, #0x0]
	cmp r0, r2
	beq exitloop
	cmp r2, #0xFF
	beq exit
	add r3, #0x1
	b loop
exitloop:	lsl r2, r3, #0x3
	add r2, r2, r1
	ldr r0, [r2, #0x4]
	pop {r1-r7}
	mov pc, r0
exit:	pop {r1-r7}
	ldr r3, return2
	bx r3
.align
tracereturn:	.word 0x0801B53D
table:	.word 0x0876510C
return2:	.word 0x0801B6D7

