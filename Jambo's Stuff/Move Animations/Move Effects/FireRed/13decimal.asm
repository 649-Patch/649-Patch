.text
.align 2
.thumb
.thumb_func
.global thirteendecimal

main:
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldrh r1, [r0, #0x28]
	ldrh r0, [r0, #0x2C]
	cmp r0, r1
	beq exit
	push {r2-r7}
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	bl divide
	add r1, r0, #0x0
	mov r0, r11
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	bl divide
	pop {r2-r7}
	cmp r0, #0x0
	bne jump
	mov r0, #0x1
jump:	mov r11, r0
exit:	ldr r0, return
	mov pc, r0
divide:	ldr r2, divcode
	bx r2
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
return:	.word 0x0876175C
divcode:	.word 0x081E4019
