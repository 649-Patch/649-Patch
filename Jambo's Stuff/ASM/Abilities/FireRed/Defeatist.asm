.text
.align 2
.thumb
.thumb_func
.global defeatist1

main:
	ldr r0, place
	ldrb r0, [r0, #0x0]
	push {r1}
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldrb r0, [r0, #0x0]
	cmp r0, #0x81
	bne skip
	ldrh r0, [r6, #0x28]
	ldrh r1, [r6, #0x2C]
	lsr r1, r1, #0x1
	cmp r0, r1
	bge skip
	lsr r7, r7, #0x1
	mov r1, r8
	lsr r1, r1, #0x1
	mov r8, r1
skip:	pop {r1}
	ldrh r0, [r6, #0x2E]
	cmp r0, #0xAF
	bne normal
	ldr r1, return2
	bx r1
normal:	ldr r0, return
	bx r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
return:	.word 0x0803EDA1
return2:	.word 0x0803ED87
