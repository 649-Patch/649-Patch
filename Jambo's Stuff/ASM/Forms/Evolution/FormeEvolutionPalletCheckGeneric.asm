.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	add r2, r0, #0x0
	ldr r0, [sp, #0x30]
	ldrb r1, [r0, #0x1B]
	mov r0, #0xF0
	and r1, r0
	lsr r1, r1, #0x2
	add r0, r2, r1
	ldr r0, [r0, #0x0]
there:	ldr r1, return
	bx r1
.align
return:	.word 0x0876650D
