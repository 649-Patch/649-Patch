.text
.align 2
.thumb
.thumb_func
.global trumpcard

main:
	ldr r0, place
	ldrb r2, [r0, #0x1]
	mov r1, #0x58
	mul r1, r2
	ldr r2, place2
	add r0, r1, r2
	ldrh r1, [r0, #0x28]
	ldrh r0, [r0, #0x2C]
	cmp r0, r1
	bne calculate
	mov r0, #0x78
	mov r11, r0
	b exit
calculate:	lsl r0, r0, #0x10
	bl divide
	add r1, r0, #0x0
	mov r0, #0x78
	lsl r0, r0, #0x10
	bl divide
	mov r11, r0
exit:	ldr r0, return
	mov pc, r0
divide:	ldr r2, divcode
	bx r2
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
return:	.word 0x0876175C
divcode:	.word 0x081E4019
