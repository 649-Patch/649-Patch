.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, [r0, #0x0]
there:	ldr r1, return
	bx r1
.align
return:	.word 0x0876650D
