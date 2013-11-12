.text
.align 2
.thumb
.thumb_func
.global simpleandcontrary

main:
	add r2, #0x8
	ldr r1, [sp, #0x20]
	add r1, #0x2C
	ldr r0, [r1, #0x0]
	mov r1, #0x1
	lsl r1, r2
	and r0, r1
	cmp r0, #0x0
	beq skip3
	b exit2
skip3:	ldr r1, place
	strb r5, [r1, #0x0]
	ldr r1, [sp, #0x20]
	add r1, #0x2C
	ldr r0, [r1, #0x0]
	mov r1, #0x1
	lsl r1, r2
	orr r0, r1
	ldr r1, [sp, #0x20]
	add r1, #0x2C
	str r0, [r1, #0x0]
	mov r0, #0x0
	b end
exit2:	mov r0, #0x1
end:	bx lr
.align
place:	.word 0x02023FDB
