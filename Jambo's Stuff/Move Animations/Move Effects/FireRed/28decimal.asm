.text
.align 2
.thumb
.thumb_func
.global twentyeightdecimal

main:
	ldr r0, place
	ldrb r1, [r0, #0x1]
	mov r0, #0x58
	mul r1, r0
	ldr r0, place2
	add r0, r0, r1
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	cmp r0, #0x56
	bne doit
	b exit
doit:	ldr r0, place
	ldrb r1, [r0, #0x1]
	ldr r0, ramloc3
	strb r1, [r0, #0x17]
	mov r0, #0x58
	mul r1, r0
	ldr r0, place2
	add r0, r0, r1
	add r0, #0x20
	mov r1, #0x56
	strb r1, [r0, #0x0]
	ldr r0, lastresult
	mov r1, #0x0
	strh r1, [r0, #0x0]
	b exitend
exit:	ldr r0, lastresult
	mov r1, #0x1
	strh r1, [r0, #0x0]
exitend:	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
ramloc3:	.word 0x02023FC4
lastresult:	.word 0x020370D0
