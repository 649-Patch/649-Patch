.text
.align 2
.thumb
.thumb_func
.global iconformehack2

main:
	pop {r0-r3}
	ldr r1, statusbyteloc
	ldrb r1, [r1, #0x1]
	lsl r1, r1, #0x1
	ldrb r5, [r5, #0x3]
	mov r0, #0x3
	lsl r0, r1
	and r0, r5
	lsr r0, r1
there:	mov r5, #0x0
	mov r11, r5
	ldr r5, number
	ldr r1, return
	bx r1
.align
statusbyteloc:	.word 0x0203C000
number:		.word 0x0000DAC0
return:		.word 0x08096E63
