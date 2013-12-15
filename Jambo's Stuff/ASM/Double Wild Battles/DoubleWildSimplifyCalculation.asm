.text
.align 2
.thumb
.thumb_func
.global doublewildwhichwascaughtfix

main:
	ldrb r4, [r1, #0x2]
	cmp r4, #0x63
	bhi doubletwo
	bl random
	mov r1, #0x64
	bl thatplace
doublethree:	add r1, r4, #0x0
	pop {r2-r7}
	cmp r0, r1
	blt double
	ldr r0, return
	bx r0
double:	ldr r0, returntwo
	bx r0
doubletwo:	mov r0, #0x0
	b doublethree
thatplace:	ldr r3, there
	bx r3
random:	ldr r2, gorandom
	bx r2
.align
there:	.word 0x081E4685
gorandom:	.word 0x08044EC9
return:	.word 0x08758717
returntwo:	.word 0x087586D9
