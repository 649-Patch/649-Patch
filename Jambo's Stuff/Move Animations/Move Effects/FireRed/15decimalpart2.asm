.text
.align 2
.thumb
.thumb_func
.global fifteendecimal

main:
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	add r0, #0x2E
	ldrh r1, [r0, #0x0]
	cmp r1, #0x85
	blt exit
	cmp r1, #0xAF
	bgt checknewberries
there:	sub r1, #0x85
	lsl r1, r1, #0x1
	ldr r2, berrynaturalgiftable
	add r1, r1, r2
	ldrb r2, [r1, #0x1]
	ldr r1, place3
	mov r0, #0x2
	strb r0, [r1, #0xE]
	ldr r0, place4
	ldr r1, [r0, #0x0]
	mov r0, #0x80
	orr r0, r2
	strb r0, [r1, #0x13]
	b exit
checknewberries:	mov r2, #0xD2
	lsl r2, r2, #0x1
	cmp r1, r2
	ble exit
	add r2, #0x15
	cmp r1, r2
	bgt exit
	sub r1, #0xF5
	b there
exit:	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
berrynaturalgiftable:	.word 0x08761C98
place3:	.word 0x02023FC4
place4:	.word 0x02023FE8
