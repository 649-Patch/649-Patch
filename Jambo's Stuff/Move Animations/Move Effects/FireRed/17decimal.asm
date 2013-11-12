.text
.align 2
.thumb
.thumb_func
.global seventeendecimal

main:
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	add r0, #0x19
	push {r3}
	mov r3, #0x0
	mov r1, #0x0
loop:	add r2, r0, r1
	ldrb r2, [r2, #0x0]
	sub r2, #0x6
	cmp r2, #0x0
	ble no
	add r3, r2, r3
no:	cmp r1, #0x6
	beq outofloop
	add r1, #0x1
	b loop
	mov r1, #0x14
	mul r1, r3
	pop {r3}
	mov r0, r11
	add r0, r0, r1
	mov r11, r0
exit:	ldr r0, return
	mov pc, r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
return:	.word 0x0876175C
