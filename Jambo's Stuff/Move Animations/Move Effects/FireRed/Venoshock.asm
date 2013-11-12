.text
.align 2
.thumb
.thumb_func
.global brine

main:
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r1, ramlocation
	add r0, r0, r1
	ldr r1, [r0, #0x4C]
	mov r0, #0x88
	and r0, r1
	cmp r0, #0x0
	beq exit
	mov r0, #0x2
	ldr r1, place2
	strb r0, [r1, #0x0]
exit:	bx lr
.align
place:	.word 0x02023D6B
ramlocation:	.word 0x02023BE4
place2:	.word 0x02023FD2
