.text
.align 2
.thumb
.thumb_func
.global abilitygethack

main:
	push {lr}
	ldr r1, there
	bx r1
.align
there:	.word 0x08242D0D
