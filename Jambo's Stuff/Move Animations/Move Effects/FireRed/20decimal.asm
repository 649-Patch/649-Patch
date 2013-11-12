.text
.align 2
.thumb
.thumb_func
.global twentydecimal

main:
	ldr r0, echoedvoiceloc
	ldrb r1, [r0, #0x0]
	mov r2, #0x28
	mul r1, r2
	add r1, r1, r2
	mov r11, r1
	ldrb r1, [r0, #0x1]
	cmp r1, #0x1
	beq skip4
	ldrb r1, [r0, #0x0]
	cmp r1, #0x4
	beq skip4
	add r1, #0x1
	strb r1, [r0, #0x0]
	mov r1, #0x1
	strb r1, [r0, #0x1]
skip4:	ldr r0, return
	mov pc, r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
echoedvoiceloc:	.word 0x0203C00C
return:	.word 0x0876175C
