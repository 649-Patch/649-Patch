.text
.align 2
.thumb
.thumb_func
.global wilddoublebatlefanfarefix

main:
	ldr r0, there
	ldr r0, [r0, #0x0]
	mov r1, #0x1
	and r0, r1
	cmp r0, #0x0
	bne doublecode
playit:	ldr r0, musictoplay
	bl musicplay
	ldr r1, returnone
	bx r1
doublecode:	push {r2}
	mov r1, #0x1
	mov r2, #0x3
	mov r0, #0x58
	mul r1, r0
	mul r2, r0
	ldr r0, baselocation
	add r1, r1, r0
	add r2, r2, r0
	ldrh r1, [r1, #0x28]
	ldrh r0, [r2, #0x28]
	pop {r2}
	cmp r1, #0x0
	bne dontplayit
	cmp r0, #0x0
	bne dontplayit
	b playit
dontplayit:	ldr r5, returntwo
	bx r5
musicplay:	ldr r1, musicplayloc
	bx r1
.align
there:		.word 0x02022B4C
musictoplay:	.word 0x00000137
returnone:	.word 0x08021D4B
returntwo:	.word 0x08021D53
musicplayloc:	.word 0x080722A1
baselocation:	.word 0x02023BE4
