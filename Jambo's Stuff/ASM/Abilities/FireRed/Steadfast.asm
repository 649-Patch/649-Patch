.text
.align 2
.thumb
.thumb_func
.global simpleandcontrary

main:
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	add r1, r0, #0x0
	add r1, #0x1B
	ldrb r2, [r1, #0x0]
	cmp r2, #0xC
	beq exit
	add r2, #0x1
	strb r2, [r1, #0x0]
	bx lr
exit:	ldr r0, scriptloc
	ldr r1, script
	str r1, [r0, #0x0]
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
scriptloc:	.word 0x02023D74
script:	.word 0x081D6949

