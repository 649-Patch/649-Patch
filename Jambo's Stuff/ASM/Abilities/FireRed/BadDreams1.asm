.text
.align 2
.thumb
.thumb_func
.global baddreams

main:
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldr r1, storageloc
	ldr r2, [r0, #0x0]
	str r2, [r1, #0x0]
	mov r2, #0x80
	lsl r2, r2, #0x14
	str r2, [r0, #0x0]
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C34
storageloc:	.word 0x0203D000
