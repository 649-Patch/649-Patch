.text
.align 2
.thumb
.thumb_func
.global snowwarningfix

main:
	mov r0, #0x18
	lsl r0, r0, #0x4
	strh r0, [r2, #0x0]
	ldr r0, bs
	ldr r1, battlescriptloc
	bx r1
.align
battlescriptloc:	.word 0x0801A2F1
bs:	.word 0x08FFFFFF
