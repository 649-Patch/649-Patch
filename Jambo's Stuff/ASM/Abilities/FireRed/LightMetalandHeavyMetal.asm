.text
.align 2
.thumb
.thumb_func
.global simpleandcontrary

main:
	ldr r1, place
	push {r0}
	ldrb r1, [r1, #0x1]
	mov r0, #0x58
	mul r1, r0
	ldr r0, place2
	add r1, r1, r0
	add r1, #0x20
	pop {r0}
	ldrb r1, [r1, #0x0]
	cmp r1, #0x86
	bne skip
	lsl r0, r0, #0x1
skip:	cmp r1, #0x87
	bne skip2
	lsr r0, r0, #0x1
skip2:	ldrh r1, [r4, #0x0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r1, r0
	bhi one
	add r4, #0x4
	add r5, #0x2
	ldr r0, returnone
	bx r0
one:	ldr r0, returntwo
	bx r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
place3:	.word 0x02023D71
returnone:	.word 0x0802C911
returntwo:	.word 0x0802C917