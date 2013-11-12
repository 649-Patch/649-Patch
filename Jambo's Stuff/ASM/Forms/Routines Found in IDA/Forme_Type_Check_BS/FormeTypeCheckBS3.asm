.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, rotom
	cmp r0, r1
	bne exit
	bl getaddress
	ldrb r0, [r0, #0x1B]
	push {r3}
	mov r3, #0xF0
	and r0, r3
	pop {r3}
	cmp r0, #0x0
	beq exit
	cmp r0, #0x10
	bne next
	add r2, #0x21
	mov r0, #0xD
	strb r0, [r2, #0x0]
	mov r0, #0xA
	strb r0, [r2, #0x1]
	b there
next:	cmp r0, #0x20
	bne next2
	add r2, #0x21
	mov r0, #0xD
	strb r0, [r2, #0x0]
	mov r0, #0xB
	strb r0, [r2, #0x1]
	b there
next2:	cmp r0, #0x40
	bne next3
	add r2, #0x21
	mov r0, #0xD
	strb r0, [r2, #0x0]
	mov r0, #0xF
	strb r0, [r2, #0x1]
	b there
next3:	cmp r0, #0x80
	bne next4
	add r2, #0x21
	mov r0, #0xD
	strb r0, [r2, #0x0]
	mov r0, #0x2
	strb r0, [r2, #0x1]
	b there
next4:	cmp r0, #0x30
	bne exit
	add r2, #0x21
	mov r0, #0xD
	strb r0, [r2, #0x0]
	mov r0, #0xC
	strb r0, [r2, #0x1]
there:	ldr r0, return
	bx r0
exit:	lsl r0, r1, #0x3
	sub r0, r0, r1
	lsl r0, r0, #0x2
	add r0, r0, r3
	ldrb r0, [r0, #0x6]
	add r2, #0x21
	strb r0, [r2, #0x0]
	ldr r0, return2
	bx r0
getaddress:	ldr r0, getadd
	bx r0	
.align
return:		.word 0x08023FD1
return2:	.word 0x08023FB9
rotom:		.word 0x000001DF
getadd:		.word 0x0874A459
