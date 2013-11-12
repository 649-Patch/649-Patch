.text
.align 2
.thumb
.thumb_func
.global eighteendecimal

main:
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldr r0, [r0, #0x4C]
	mov r1, #0x8
	and r0, r1
	cmp r0, #0x0
	beq exit
	mov r0, r11
	lsl r0, r0, #0x1
	mov r11, r0
exit:	ldr r0, return
	mov pc, r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
return:	.word 0x0876175C
