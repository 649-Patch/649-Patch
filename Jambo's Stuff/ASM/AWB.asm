.text
.align 2
.thumb
.thumb_func
.global varflaghackone

main:
	pop {r0}
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	lsr r0, r0, #0x18
	cmp r0, #0x50
	bcc next
	cmp r0, #0x60
	bge next
	ldr r0, ramloc
	mov r1, #0x50
	lsl r1, r1, #0x8
	sub r1, r4, r1
	mul r1, #0x2
	add r0, r0, r1
	ldr r1, return
	bx r1
next:	add r0, r4, #0x0
	ldr r1, return2
	mov lr, r1
	ldr r1, return3
	bx r1
.align
return:	.word 0x0806E519
return2:	.word 0x0806E575
return3:	.word 0x0806E455