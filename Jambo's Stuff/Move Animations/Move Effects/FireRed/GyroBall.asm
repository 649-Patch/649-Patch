.text
.align 2
.thumb
.thumb_func
.global heatcrash

main:
	ldr r0, place
	ldrb r2, [r0, #0x1]
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	mul r1, r2
	ldr r2, place2
	add r0, r0, r2
	add r1, r1, r2
	ldrh r5, [r0, #0x6]
	ldrh r6, [r1, #0x6]
	ldrb r2, [r0, #0x1B]
	ldrb r0, [r1, #0x1B]
	lsl r0, r0, #0x1
	lsl r2, r2, #0x1
	ldr r1, dead
	add r0, r0, r1
	add r2, r2, r1
	ldrb r0, [r0, #0x0]
	ldrb r4, [r2, #0x0]
	mul r0, r5
	mul r4, r6
	mov r1, #0xA
	bl divide
	add r5, r0, #0x0
	add r0, r4, #0x0
	mov r1, #0xA
	bl divide
	lsl r0, r0, #0x8
	add r1, r5, #0x0
	bl divide
	mov r1, #0x19
	mul r0, r1
	lsr r0, r0, #0x8
	cmp r0, #0x96
	bls exit
	mov r0, #0x96
exit:	mov r11, r0
	ldr r0, return
	mov pc, r0
divide:	ldr r2, divcode
	bx r2
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
return:	.word 0x0876175C
divcode:	.word 0x081E4019
dead:	.word 0x0825DEAD
