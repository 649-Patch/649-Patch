.text
.align 2
.thumb
.thumb_func
.global wonderguardnerf3

main:
	mov r0, r8
	add r0, #0x4C
	add r0, r1, r0
	ldr r0, [r0, #0x0]
	mov r1, #0xFF
	and r0, r1
	cmp r0, #0x0
	bne alt
	mov r4, #0x1
	mov r10, r4
alt:	mov r1, r10
	cmp r1, #0x1
	beq there
	ldr r2, return
	bx r2
there:	ldr r0, return2
	bx r0
.align
return:	.word 0x08020695
return2:	.word 0x08020579
