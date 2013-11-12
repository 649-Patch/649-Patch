.text
.align 2
.thumb
.thumb_func
.global formetypecheck1

main:
	ldr r0, [r3, #0x0]
	ldr r0, [r0, #0x0]
	add r1, r4, #0x0
	bl place
	ldr r0, return
	bx r0
place:	ldr r3, therething
	bx r3
.align
return:		.word 0x0800ECB5
therething:	.word 0x081E3B71
