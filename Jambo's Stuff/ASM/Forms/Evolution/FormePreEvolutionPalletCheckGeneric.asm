.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:	add r3, r0, #0x0
	ldrb r0, [r0, #0x1B]
	mov r2, #0xF0
	and r0, r2
	lsr r1, r0, #0x2
	ldr r0, [r3, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	ldr r1, return
	bx r1
.align
return:		.word 0x087666AF
