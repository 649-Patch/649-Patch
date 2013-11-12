.text
.align 2
.thumb
.thumb_func
.global iconformehack2

main:
	mov r1, r11
	ldrb r1, [r1, #0x1B]
	mov r2, #0xF0
	and r1, r2
	lsr r1, r1, #0x4
there:	mov r2, #0x4
	lsl r2, r2, #0x8
	mul r1, r2
	ldr r2, normaltable
	lsl r0, r0, #0x2
	add r0, r0, r2
	ldr r0, [r0, #0x0]
	add r0, r0, r1
	pop {r1}
	bx r1
.align
normaltable:	.word 0x0873D744
