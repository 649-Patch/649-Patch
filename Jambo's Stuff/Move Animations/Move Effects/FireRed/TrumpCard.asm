.text
.align 2
.thumb
.thumb_func
.global trumpcard

main:
	ldr r0, place
	ldrb r2, [r0, #0x0]
	ldr r0, ramlocation2
	add r0, r0, r2
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r1, r2
	ldr r2, place2
	add r1, r1, r2
	add r0, r0, r1
	add r0, #0x24
	ldrb r0, [r0, #0x0]
	cmp r0, #0x4
	bls skip
	mov r0, #0x4
skip:	sub r0, #0x1
	ldr r1, powertable
	add r0, r0, r1
	ldrb r0, [r0, #0x0]
	mov r11, r0
exit:	ldr r0, return
	mov pc, r0
.align
place:	.word 0x02023D6B
ramlocation2:	.word 0x02000090
place2:	.word 0x02023BE4
powertable:	.word 0x08FFFFFF
return:	.word 0x0876175C
