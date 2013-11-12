.text
.align 2
.thumb
.thumb_func
.global sheerforceII

main:
	push {r0}
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r1, r0
	ldr r0, place2
	add r0, r0, r1
	ldrb r1, [r0, #0x0]
	pop {r0}
	cmp r0, #0x13
	beq noeffects
	cmp r1, #0x7D
	bne exit
noeffects:	ldr r0, place3
	ldr r0, [r0, #0x0]
	ldr r1, returnone
	bx r1
exit:	ldr r3, returntwo
	bx r3
.align
returnone:	.word 0x0801FFCD
returntwo:	.word 0x0801FFE7
place3:	.word 0x02023DD0
place:	.word 0x02023D6B
place2:	.word 0x02023C04
