.text
.align 2
.thumb
.thumb_func
.global leafguard

main:
	ldr r6, place
	ldrb r0, [r6, #0x0]
	mov r4, #0x58
	mul r0, r4
	ldr r2, place2
	add r0, r0, r2
	add r1, r0, #0x0
	add r1, #0x20
	ldrb r1, [r1, #0x0]
	cmp r1, #0x97
	bne skip
	mov r1, #0x23
	bic r3, r1
skip:	ldr r1, return
	bx r1
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
return:	.word 0x0801E5C1
