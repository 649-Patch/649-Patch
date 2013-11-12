.text
.align 2
.thumb
.thumb_func
.global mummyandironbarbs

main:
	mov r1, r8
	ldrb r0, [r1, #0x0]
	push {r1-r7}
	mov r2, #0x0
loop:	ldr r1, table
	lsl r3, r2, #0x3
	add r3, r3, r1
	ldrb r1, [r3, #0x0]
	cmp r0, r1
	beq exitloop
	cmp r1, #0xFF
	beq exitnormal
	add r2, #0x1
	b loop
exitloop:	ldr r0, [r3, #0x4]
	pop {r1-r7}
	mov pc, r0
exitnormal:	pop {r1-r7}
	cmp r0, #0xA0
	bne normal2
	mov r0, #0x18
	b normal3
normal2:	cmp r0, #0x8F
	bne normal11
	mov r0, #0x26
	b normal3
normal11:	mov r1, r8
	ldrb r0, [r1, #0x0]
normal3:	sub r0, #0x9
	cmp r0, #0x2F
	bls normal4
	bl exit
normal4:	lsl r0, r0, #0x2
	ldr r1, return
	bx r1
exit:	ldr r4, exitloc
	bx r4
.align
return:	.word 0x0801A8C9
exitloc:	.word 0x0801BBAB
table:	.word 0x08763DC8
