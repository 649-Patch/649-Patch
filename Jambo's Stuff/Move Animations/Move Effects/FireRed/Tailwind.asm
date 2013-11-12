.text
.align 2
.thumb
.thumb_func
.global tailwindeffect

main:
	push {r1-r7}
	ldr r4, tailwindramloc
	mov r5, r9
	mov r6, r10
	mov r3, #0x1
	and r5, r3
	and r6, r3
	add r5, r5, r4
	add r6, r6, r4
	ldrb r5, [r5, #0x0]
	ldrb r6, [r6, #0x0]
	mov r4, r8
	cmp r5, #0x0
	beq skip
	lsl r4, r4, #0x1
skip:	cmp r6, #0x0
	beq skip2
	lsl r7, r7, #0x1
skip2:	mov r8, r4
	pop {r1-r7}
	ldr r4, return
	bx r4
.align
tailwindramloc:	.word 0x0203D815
return:	.word 0x08764991
