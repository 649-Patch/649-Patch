.text
.align 2
.thumb
.thumb_func
.global quickfeet1

main:
	mov r0, #0x58
	mov r3, r9
	mul r0, r3
	add r1, #0x20
	add r0, r0, r1
	ldrb r0, [r0, #0x0]
	cmp r0, #0x5F
	beq skip
	mov r0, #0x58
	mov r3, r9
	mul r0, r3
	add r1, #0x2C
	add r0, r0, r1
	ldr r0, [r0, #0x0]
there:	ldr r1, return
	bx r1
skip:	mov r0, #0x0
	b there
.align
return:	.word 0x08014E57