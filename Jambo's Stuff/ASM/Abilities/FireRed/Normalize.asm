.text
.align 2
.thumb
.thumb_func
.global normalize

main:
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldrb r0, [r0, #0x0]
	cmp r0, #0x60
	bne exit
	ldr r1, place3
	mov r0, #0x2
	strb r0, [r1, #0xE]
	ldr r0, place4
	ldr r1, [r0, #0x0]
	mov r0, #0x80
	strb r0, [r1, #0x13]
exit:	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
place3:	.word 0x02023FC4
place4:	.word 0x02023FE8
