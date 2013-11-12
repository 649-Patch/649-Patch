.text
.align 2
.thumb
.thumb_func
.global wonderroom

main:
	ldrb r3, [r2, #0x0]
	push {r6}
	cmp r3, #0x6E
	bne notfoulplay
	ldr r6, [sp, #0x8]
notfoulplay:	ldr r2, wonderroomloc
	ldrb r2, [r2, #0x0]
	cmp r2, #0x0
	bne skip
	mov r3, #0x4
	mov r0, #0xA
	b continue
skip:	mov r3, #0xA
	mov r0, #0x4
continue:	ldr r2, [sp, #0x8]
	ldsh r2, [r2, r3]
	str r2, [sp, #0x18]
	ldrh r3, [r6, #0x8]
	mov r8, r3
	ldr r2, [sp, #0x8]
	ldsh r0, [r2, r0]
	str r0, [sp, #0x1C]
	pop {r6}
	ldr r0, return
	bx r0
.align
wonderroomloc:	.word 0x0203D803
return:	.word 0x08761367
