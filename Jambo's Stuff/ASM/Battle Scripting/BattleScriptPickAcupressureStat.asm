.text
.align 2
.thumb
.thumb_func
.global battlescriptjumpifuseristarget

main:
	push {lr}	
ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	ldrb r7, [r0, #0x1]
	ldrb r6, [r0, #0x2]
	lsl r6, r6, #0x8
	orr r7, r6
	ldrb r6, [r0, #0x3]
	lsl r6, r6, #0x10
	orr r7, r6
	ldrb r6, [r0, #0x4]
	lsl r6, r6, #0x18
	orr r7, r6
	add r0, #0x5
	str r0, [r5, #0x0]
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r1, r0
	ldr r4, place2
	add r4, r4, r1
	add r4, #0x19
	mov r2, #0x0
	mov r3, #0x0
thisloop:	add r6, r4, r3
	ldrb r1, [r6, #0x0]
	cmp r1, #0xB
	bne skip
	add r2, #0x1
skip:	cmp r3, #0x6
	beq exitthisloop
	add r3, #0x1
	b thisloop
exitthisloop:	cmp r2, #0x7
	bne loopback
	str r7, [r5, #0x0]
	pop {pc}
loopback:	bl random
	mov r1, #0x7
	bl divmod
	add r2, r4, #0x0
	add r2, r2, r0
	ldrb r3, [r2, #0x0]
	cmp r3, #0xB
	blt continue
	b loopback
continue:	ldr r1, place3
	add r2, r0, #0x0
	add r2, #0x21
	strb r2, [r1, #0x0]
	add r0, #0x1
	mov r2, #0x1
	lsl r2, r0
	strb r2, [r1, #0x1]
	pop {pc}
random:	ldr r2, rand
	bx r2
divmod:	ldr r3, divmodloc
	bx r3
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
place3:	.word 0x02023FDE
divmodloc:	.word 0x081E4685
rand:	.word 0x08044EC9
