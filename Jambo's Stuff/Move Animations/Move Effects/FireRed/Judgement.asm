.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	add r0, #0x2E
	ldrh r2, [r0, #0x0]
	sub r2, #0xE1
	cmp r2, #0x1
	blt exit
	cmp r2, #0x9
	beq exit
	cmp r2, #0x11
	bgt exit
	ldr r1, place3
	mov r0, #0x2
	strb r0, [r1, #0xE]
	ldr r0, place4
	ldr r1, [r0, #0x0]
	mov r0, #0x80
	orr r0, r2
	strb r0, [r1, #0x13]
exit:	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
place3:	.word 0x02023FC4
place4:	.word 0x02023FE8
