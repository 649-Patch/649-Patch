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
	mov r3, #0xF0
	and r0, r3
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
there:	ldr r1, return
	bx r1
exit:	lsl r0, r1, #0x3
	sub r0, r0, r1
	lsl r0, r0, #0x2
	add r0, r0, r6
	ldrb r0, [r0, #0x6]
	add r2, #0x21
	strb r0, [r2, #0x0]
	ldr r2, return2
	bx r2
getaddress:	push {r1-r7,lr}
	add r0, r2, #0x0
	add r0, #0x48
	ldr r0, [r0, #0x0]
	mov r4, #0x0
	ldr r1, enemyparty
loop:	mov r5, #0x64
	mul r5, r4
	add r3, r1, r5
	ldr r6, [r3, #0x0]
	cmp r0, r6
	beq exitloop1
	add r4, #0x1
	cmp r4, #0x6
	beq exitloop2
	b loop
exitloop2:	mov r4, #0x0
	ldr r1, partystart
loop2:	mov r5, #0x64
	mul r5, r4
	add r3, r1, r5
	ldr r6, [r3, #0x0]
	cmp r0, r6
	beq exitloop1
	add r4, #0x1
	cmp r4, #0x6
	beq exitloop3
	b loop2
exitloop3:	ldr r0, partystart
	pop {r1-r7,pc}
exitloop1:	add r0, r3, #0x0
	pop {r1-r7,pc}
.align
return:		.word 0x08013145
return2:	.word 0x0801312B
partystart:	.word 0x02024284
enemyparty:	.word 0x0202402C
rotom:		.word 0x000001DF
