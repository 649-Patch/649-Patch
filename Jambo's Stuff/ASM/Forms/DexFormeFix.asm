.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, [r6, #0x0]
	ldr r0, [r0, #0x0]
	add r1, r4, #0x0
	bl there
	ldr r0, return
	bx r0
there:	ldr r3, gothere
	bx r3
.align
return:	.word 0x0800ED8D
gothere:	.word 0x081E3B71
