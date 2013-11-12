.text
.align 2
.thumb
.thumb_func
.global magicroom

main:
	ldr r1, place
	ldrb r1, [r1, #0x0]
	cmp r1, #0x0
	beq skip
	mov r0, #0x0
	pop {r4}
	pop {r1}
	bx r1
skip:	ldr r1, return
	bx r1
.align
place:	.word 0x0203D80F
return:	.word 0x0876610D
