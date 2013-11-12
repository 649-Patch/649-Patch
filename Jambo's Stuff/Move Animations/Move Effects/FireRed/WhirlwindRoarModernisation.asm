.text
.align 2
.thumb
.thumb_func
.global whirlwindroarmodernisation

main:
	ldr r3, place
	ldrh r3, [r3, #0x0]
	cmp r3, #0x2E
	bne skip
	ldr r3, fail
	bx r3
skip:	cmp r1, r0
	bne skip2
	ldr r0, return
	bx r0
skip2:	bl random
	mov r3, #0xFF
	and r3, r0
	ldr r0, returntwo
	bx r0
random:	ldr r2, gorandom
	bx r2
.align
place:	.word 0x02023D4A
fail:	.word 0x080282BB
return:	.word 0x080282DD
gorandom:	.word 0x08044EC9
returntwo:	.word 0x08028295
