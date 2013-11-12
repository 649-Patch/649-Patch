.text
.align 2
.thumb
.thumb_func
.global gravityclearattack

main:
	ldr r5, place
	ldrb r5, [r5, #0x0]
	add r1, r4, r3
	ldrb r1, [r1, #0x1F]
	cmp r5, #0x0
	beq skip
	cmp r1, #0x2
	blt alt
	sub r1, #0x2
	b skip
alt:	mov r1, #0x0
skip:	sub r0, r0, r1
	lsl r0, r0, #0x18
	ldr r5, return
	bx r5
.align
place:	.word 0x0203D802
return:	.word 0x0801DFAD
