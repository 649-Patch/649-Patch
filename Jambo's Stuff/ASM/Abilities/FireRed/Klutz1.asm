.text
.align 2
.thumb
.thumb_func
.global klutz

main:
	mov r1, #0x2C
	mul r0, r1
	add r0, r0, r4
	ldrb r0, [r0, #0x12]
	cmp r0, #0x28
	beq exit
	cmp r0, #0x18
	beq exit
	cmp r0, #0x20
	beq exit
	push {r0}
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldrb r0, [r0, #0x0]
	cmp r0, #0x67
	bne exit2
	pop {r0}
	mov r0, #0x0
	b exit
exit2:	pop {r0}
exit:	pop {r4}
	pop {r1}
	bx r1
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
