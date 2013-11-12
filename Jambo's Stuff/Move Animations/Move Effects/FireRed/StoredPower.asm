.text
.align 2
.thumb
.thumb_func
.global trumpcard

main:
	ldr r0, place
	ldrb r2, [r0, #0x0]
	mov r1, #0x58
	mul r1, r2
	ldr r2, place2
	add r0, r1, r2
	add r0, #0x19
	mov r1, #0x0
	mov r3, #0x0
loop:	add r2, r0, r1
	ldrb r2, [r2, #0x0]
	cmp r2, #0x6
	bls skip
	sub r2, #0x6
	add r3, r2, r3
skip:	cmp r1, #0x6
	beq exitloop2
	add r1, #0x1
	b loop
exitloop2:	mov r0, #0x14
	mul r0, r3
	add r0, #0x14
	mov r11, r0
exit:	ldr r0, return
	mov pc, r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
return:	.word 0x0876175C
