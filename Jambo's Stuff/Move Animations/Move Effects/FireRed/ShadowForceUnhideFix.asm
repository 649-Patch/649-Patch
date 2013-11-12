.text
.align 2
.thumb
.thumb_func
.global shadowforceunhidefix

main:
	ldr r0, moveone
	cmp r1, r0
	beq works
	add r0, #0x31
	cmp r1, r0
	beq works
	add r0, #0x7F
	cmp r1, r0
	bne no
works:	ldr r2, returnone
	bx r2
no:	ldr r1, returntwo
	bx r1
.align
moveone:	.word 0x00000123
returnone:	.word 0x0802BBC9
returntwo:	.word 0x0802BC17
