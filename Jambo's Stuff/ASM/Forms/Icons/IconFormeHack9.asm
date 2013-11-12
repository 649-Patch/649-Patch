.text
.align 2
.thumb
.thumb_func
.global iconformehack2

main:
	ldr r1, statusbyteloc
	ldrb r1, [r1, #0x1]
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
statusbyteloc:	.word 0x0203C000
