.text
.align 2
.thumb
.thumb_func
.global gravityclearattack

main:
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldr r1, [r0, #0x0]
	mov r2, #0x10
	lsl r2, r2, #0x8
	bic r1, r2
	str r1, [r0, #0x0]
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C34
