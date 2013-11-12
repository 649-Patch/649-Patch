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
	cmp r2, #0xF4
	bne next
	mov r2, #0xA
	b store
next:	cmp r2, #0xF5
	bne next2
	mov r2, #0xB
	b store
next2:	cmp r2, #0xF6
	bne next3
	mov r2, #0xF
	b store
next3:	cmp r2, #0xF7
	bne exit
	mov r2, #0xD
store:	ldr r1, place3
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
