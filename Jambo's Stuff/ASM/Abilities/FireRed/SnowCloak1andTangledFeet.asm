.text
.align 2
.thumb
.thumb_func
.global snowcloak1

main:
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mul r0, r5
	add r0, r0, r7
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	cmp r0, #0x4C
	bne next
	b tangledfeet
next:	cmp r0, #0x51
	bne nextcheck
	b snowcloak
nextcheck:	cmp r0, #0x8
	bne exit
	b sandveil
snowcloak:	mov r0, #0x80
	b universalcheck
sandveil:	mov r0, #0x18
universalcheck:	ldr r1, weatherbits
	ldrh r1, [r1, #0x0]
	and r0, r1
	cmp r0, #0x0
	beq exit
there:	lsl r0, r4, #0x2
	add r0, r0, r4
	lsl r0, r0, #0x4
	mov r1, #0x64
	bl divide
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
exit:	ldr r2, return
	bx r2
divide:	ldr r2, divcode
	bx r2
tangledfeet:	ldr r0, place
	ldrb r0, [r0, #0x1]
	mul r0, r5
	add r0, r0, r7
	add r0, #0x50
	ldr r0, [r0, #0x0]
	cmp r0, #0x0
	beq exit
	b there
.align
return:	.word 0x0801E0A9
weatherbits:	.word 0x02023F1C
place:	.word 0x02023D6B
divcode:	.word 0x081E4019
