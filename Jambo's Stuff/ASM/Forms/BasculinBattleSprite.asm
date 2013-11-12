.text
.align 2
.thumb
.thumb_func
.global abilitygethack

main:
	ldr r0, [sp, #0x1C]
	ldrb r0, [r0, #0x1B]
	mov r1, #0xF0
	and r0, r1
	cmp r0, #0x0
	beq skip
	mov r0, #0x1
skip:	lsl r1, r0, #0x2
	ldr r0, [r6, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	add r1, r5, #0x0
	ldr r3, there
	bx r3
.align
there:	.word 0x0874B707