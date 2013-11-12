.text
.align 2
.thumb
.thumb_func
.global iconformehack2

main:
	ldr r1, statusbyteloc
	ldrb r1, [r1, #0x1]
	lsl r1, r1, #0x1
	ldrb r5, [r5, #0x3]
	mov r0, #0x3
	lsl r0, r1
	and r0, r5
	lsr r0, r1
	add r7, r0, #0x0
	pop {r0-r5}
	ldr r0, number
	add r0, r0, r7
	strh r0, [r2, #0x2]
	ldr r0, return
	bx r0
.align
statusbyteloc:	.word 0x0203C000
number:		.word 0x0000DAC0
return:	.word 0x08091331
