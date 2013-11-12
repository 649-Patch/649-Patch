.text
.align 2
.thumb
.thumb_func
.global heartswap

main:
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r1, r0
	add r0, #0x19
	push {r0}
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r1, r1, r0
	add r1, #0x19
	pop {r0}
	mov r2, #0xFF
loop:	add r2, #0x1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	add r3, r2, r0
	add r4, r2, r1
	ldrb r5, [r3, #0x0]
	ldrb r6, [r4, #0x0]
	strb r5, [r4, #0x0]
	strb r6, [r3, #0x0]
	cmp r2, #0x6
	blt loop
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
