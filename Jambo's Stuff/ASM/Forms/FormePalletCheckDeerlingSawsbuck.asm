.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, timeofyearloc
	ldrb r0, [r0, #0x1]
	sub r0, #0x1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0xFF
	bne next
	mov r0, #0x3
next:	lsl r0, r0, #0x2
	ldr r1, [r1, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	pop {r4,r5}
	pop {r1}
	bx r1
.align
timeofyearloc:	.word 0x0203C000
